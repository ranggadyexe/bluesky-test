-- rawr.lua - Test all Bluesky features
-- Load Bluesky UI from GitHub
local success, Bluesky = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ranggadyexe/bluesky-test/main/Bluesky.lua"))()
end)

if not success or not Bluesky then
    warn("Failed to load Bluesky UI")
    return
end

-- Create main window with ALL features enabled
local Window = Bluesky:CreateWindow({
    Name = "Rawr Test UI",
    Subtitle = "Testing All Bluesky Features v" .. Bluesky.Version,
    Icon = "zap", -- Will use Lucide icon
    Theme = "Bluesky",
    Density = "Comfortable",
    ToggleUIKeybind = Enum.KeyCode.RightControl,
    Resizable = true,
    ConfirmClose = true,
    MaxNotifications = 6,
    DisableBuildWarnings = false,
    
    -- Discord Integration
    Discord = {
        Enabled = true,
        Invite = "invitecode", -- Replace with actual invite code
        RememberJoins = true,
    },
    
    -- Key System
    KeySystem = true,
    KeySettings = {
        Enabled = true,
        Title = "Rawr Test Key System",
        Subtitle = "Enter Key to Access",
        Note = "Get key from our Discord server",
        FileName = "RawrTestKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"test-key-123", "secret-key-456"},
    },
    
    -- Configuration Saving
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RawrTestUI",
        FileName = "main_config",
        AutoLoad = true,
        AutoSave = true,
        SaveWindowState = true,
    },
})

if not Window then
    warn("Failed to create window")
    return
end

-- Create Tabs with Lucide icons
local MainTab = Window:CreateTab("Main", "home")
local FeaturesTab = Window:CreateTab("Features", "sparkles")
local SettingsTab = Window:CreateTab("Settings", "settings")

-- === MAIN TAB ===
local DemoSection = MainTab:CreateSection({
    Name = "Demo Components",
    Icon = "layout-dashboard",
    Collapsible = true,
})

-- Button
DemoSection:CreateButton({
    Name = "Test Button",
    Icon = "play",
    Callback = function()
        Window:Notify({
            Title = "Button Pressed",
            Content = "You clicked the test button!",
            Type = "success",
        })
    end,
})

-- Toggle
DemoSection:CreateToggle({
    Name = "Test Toggle",
    CurrentValue = false,
    Flag = "test_toggle",
    Callback = function(value)
        Window:Notify({
            Title = "Toggle Changed",
            Content = "Toggle is now: " .. tostring(value),
            Type = "info",
        })
    end,
})

-- Slider
DemoSection:CreateSlider({
    Name = "Test Slider",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = 50,
    Flag = "test_slider",
    Callback = function(value)
        print("Slider value:", value)
    end,
})

-- Input
DemoSection:CreateInput({
    Name = "Test Input",
    CurrentValue = "",
    PlaceholderText = "Type something...",
    Flag = "test_input",
    Callback = function(text)
        print("Input text:", text)
    end,
})

-- Dropdown
DemoSection:CreateDropdown({
    Name = "Test Dropdown",
    Options = {"Option A", "Option B", "Option C"},
    CurrentOption = "Option A",
    Flag = "test_dropdown",
    Search = true,
    Callback = function(option)
        print("Selected:", option)
    end,
})

-- Multi Dropdown
DemoSection:CreateMultiDropdown({
    Name = "Test Multi Dropdown",
    Options = {"Item 1", "Item 2", "Item 3", "Item 4"},
    CurrentOption = {"Item 1"},
    Flag = "test_multi_dropdown",
    MaxVisibleOptions = 4,
    Callback = function(options)
        print("Selected items:", unpack(options))
    end,
})

-- Color Picker
DemoSection:CreateColorPicker({
    Name = "Test Color Picker",
    Color = Color3.fromRGB(255, 100, 100),
    Flag = "test_color",
    Callback = function(color)
        print("Color changed:", color)
    end,
})

-- Keybind
DemoSection:CreateKeybind({
    Name = "Test Keybind",
    CurrentKeybind = "F",
    Flag = "test_keybind",
    Callback = function(key)
        print("Keybind pressed:", key)
    end,
})

-- === FEATURES TAB ===
local LucideSection = FeaturesTab:CreateSection({
    Name = "Lucide Icons Demo",
    Icon = "palette",
    Collapsible = true,
})

-- Show various Lucide icons
local icons = {"home", "search", "settings", "user", "bell", "shield", "zap", "heart", "star", "check", "x", "plus", "minus", "trash", "edit", "save", "refresh", "download", "upload", "mail"}

for _, iconName in ipairs(icons) do
    LucideSection:CreateLabel({
        Text = "Icon: " .. iconName,
        Icon = iconName,
    })
end

-- Card with Bold and Italic
CardSection:CreateCard({
    Title = "Sample Card with Formatting",
    Content = "This is a card component with <b>bold text</b>, <i>italic text</i>, and <b><i>bold italic</i></b> support using Roblox RichText.",
})

-- Image with actual Roblox asset
CardSection:CreateImage({
    Text = "Roblox Logo",
    Image = "rbxassetid://601589193", -- Roblox logo image
})

-- Paragraph
CardSection:CreateParagraph({
    Title = "Paragraph Title",
    Content = "This is a paragraph component for displaying longer text content with proper wrapping and formatting.",
})

-- Divider
CardSection:CreateDivider({
    Text = "Divider with Text",
})

-- === SETTINGS TAB ===
local ConfigSection = SettingsTab:CreateSection({
    Name = "Configuration",
    Icon = "database",
})

-- Config Manager
ConfigSection:CreateConfigManager({
    Name = "Config Manager",
})

-- Theme Editor
ConfigSection:CreateThemeEditor({
    Name = "Theme Editor",
})

-- Settings from Bluesky
local SettingsSection = SettingsTab:CreateSection({
    Name = "Bluesky Settings",
    Icon = "settings",
})

SettingsSection:CreateKeybind({
    Name = "UI Toggle Key",
    CurrentKeybind = Bluesky.Settings.General.blueskyOpen.Value,
    Flag = "ui_toggle_key",
    Callback = function(key)
        Bluesky.Settings.General.blueskyOpen.Value = key
        Window:Notify({
            Title = "Key Updated",
            Content = "UI toggle key set to: " .. key,
            Type = "success",
        })
    end,
})

-- Test notifications
local NotifySection = SettingsTab:CreateSection({
    Name = "Test Notifications",
    Icon = "bell",
})

NotifySection:CreateButton({
    Name = "Test Success Notification",
    Icon = "check-circle",
    Callback = function()
        Window:Notify({
            Title = "Success!",
            Content = "This is a success notification.",
            Type = "success",
            Duration = 3,
        })
    end,
})

NotifySection:CreateButton({
    Name = "Test Warning Notification",
    Icon = "alert-triangle",
    Callback = function()
        Window:Notify({
            Title = "Warning!",
            Content = "This is a warning notification.",
            Type = "warning",
            Duration = 3,
        })
    end,
})

NotifySection:CreateButton({
    Name = "Test Error Notification",
    Icon = "alert-octagon",
    Callback = function()
        Window:Notify({
            Title = "Error!",
            Content = "This is an error notification.",
            Type = "error",
            Duration = 3,
        })
    end,
})

NotifySection:CreateButton({
    Name = "Test Info Notification",
    Icon = "info",
    Callback = function()
        Window:Notify({
            Title = "Info",
            Content = "This is an info notification.",
            Type = "info",
            Duration = 3,
        })
    end,
})

-- Confirm dialog test
NotifySection:CreateButton({
    Name = "Test Confirm Dialog",
    Icon = "help-circle",
    Callback = function()
        Window:Confirm({
            Title = "Confirm Action",
            Content = "This is a confirm dialog test. Do you want to proceed?",
            ConfirmText = "Yes",
            CancelText = "No",
            ConfirmColor = Color3.fromRGB(64, 213, 140),
            OnConfirm = function()
                Window:Notify({
                    Title = "Confirmed!",
                    Content = "You confirmed the action.",
                    Type = "success",
                })
            end,
            OnCancel = function()
                Window:Notify({
                    Title = "Cancelled",
                    Content = "You cancelled the action.",
                    Type = "info",
                })
            end,
        })
    end,
})

-- Show window info
Window:Notify({
    Title = "Rawr Test UI Loaded!",
    Content = "All Bluesky features are now active. Test the UI components!",
    Type = "success",
    Duration = 5,
})

print("[Rawr.lua] All features loaded successfully!")
print("[Rawr.lua] Features enabled:")
print("  - Full Lucide Roblox icons")
print("  - Discord integration")
print("  - Key System")
print("  - DisableBuildWarnings")
print("  - Config saving")
print("  - All UI components")
