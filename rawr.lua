local success, Bluesky = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ranggadyexe/bluesky-test/main/Bluesky.lua"))()
end)

if not success or not Bluesky then
    warn("Failed to load Bluesky UI")
    return
end

local Window = Bluesky:CreateWindow({
    Name = "Rawr Test UI",
    Subtitle = "Testing All Bluesky Features v" .. Bluesky.Version,
    Icon = "zap",
    Theme = "Bluesky",
    Density = "Comfortable",
    ToggleUIKeybind = Enum.KeyCode.RightControl,
    Resizable = true,
    ConfirmClose = true,
    MaxNotifications = 6,
    DisableBuildWarnings = false,
    
    Discord = {
        Enabled = true,
        Invite = "invitecode",
        RememberJoins = true,
    },
    
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

local MainTab = Window:CreateTab("Main", "home")
local FeaturesTab = Window:CreateTab("Features", "sparkles")
local SettingsTab = Window:CreateTab("Settings", "settings")

local DemoSection = MainTab:CreateSection({
    Name = "Demo Components",
    Icon = "layout-dashboard",
    Collapsible = true,
})

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

DemoSection:CreateInput({
    Name = "Test Input",
    CurrentValue = "",
    PlaceholderText = "Type something...",
    Flag = "test_input",
    Callback = function(text)
        print("Input text:", text)
    end,
})

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

DemoSection:CreateColorPicker({
    Name = "Test Color Picker",
    Color = Color3.fromRGB(255, 100, 100),
    Flag = "test_color",
    Callback = function(color)
        print("Color changed:", color)
    end,
})

DemoSection:CreateKeybind({
    Name = "Test Keybind",
    CurrentKeybind = "F",
    Flag = "test_keybind",
    Callback = function(key)
        print("Keybind pressed:", key)
    end,
})

local LucideSection = FeaturesTab:CreateSection({
    Name = "Lucide Icons Demo (2 Columns)",
    Icon = "palette",
    Collapsible = true,
    Columns = 2,
})

local icons = {"home", "search", "settings", "user", "bell", "shield", "zap", "heart", "star", "check", "x", "plus", "minus", "trash", "edit", "save", "refresh", "download", "upload", "mail"}

for _, iconName in ipairs(icons) do
    LucideSection:CreateLabel({
        Text = "Icon: " .. iconName,
        Icon = iconName,
    })
end

local CardSection = FeaturesTab:CreateSection({
    Name = "Card Demo (2 Columns) - 10 Formatting Examples",
    Icon = "file-text",
    Columns = 2,
})

CardSection:CreateCard({
    Title = "1. Bold Text",
    Content = "This card uses <b>bold text</b> formatting with RichText support.",
})

CardSection:CreateCard({
    Title = "2. Italic Text",
    Content = "This card uses <i>italic text</i> formatting for emphasis.",
})

CardSection:CreateCard({
    Title = "3. Underline",
    Content = "Text with <u>underline</u> decoration using RichText.",
})

CardSection:CreateCard({
    Title = "4. Strikethrough",
    Content = "Text with <s>strikethrough</s> for deleted content.",
})

CardSection:CreateCard({
    Title = "5. Font Size",
    Content = "Different sizes: <font size='24'>Large</font>, <font size='14'>Normal</font>, <font size='10'>Small</font>.",
})

CardSection:CreateCard({
    Title = "6. Font Color",
    Content = "Colored text: <font color='#FF0000'>Red</font>, <font color='#00FF00'>Green</font>, <font color='#0000FF'>Blue</font>.",
})

CardSection:CreateCard({
    Title = "7. Font Face",
    Content = "Different fonts: <font face='Arial'>Arial</font>, <font face='SourceSansPro'>Source Sans</font>.",
})

CardSection:CreateCard({
    Title = "8. Combined Bold+Italic",
    Content = "Combined: <b><i>bold and italic</i></b> together in one text.",
})

CardSection:CreateCard({
    Title = "9. Stroke/Border",
    Content = "Text with <stroke color='#FF0000' joins='true' thickness='2'>stroke/border</stroke> effect.",
})

CardSection:CreateCard({
    Title = "10. Uppercase + All",
    Content = "<b>UPPERCASE BOLD</b>, <i>italic lowercase</i>, <u>underline</u>, <font color='#FFA500' size='16'>Orange Large</font>.",
})

local ImageSection = FeaturesTab:CreateSection({
    Name = "Image Demo",
    Icon = "image",
})

ImageSection:CreateImage({
    Text = "Roblox Logo",
    Image = "rbxassetid://601589193",
})

local ParagraphSection = FeaturesTab:CreateSection({
    Name = "Paragraph Demo - 10 Formatting Examples",
    Icon = "align-left",
})

ParagraphSection:CreateParagraph({
    Title = "1. Basic Bold & Italic",
    Content = "This paragraph shows <b>bold text</b> and <i>italic text</i> using Roblox RichText formatting.",
})

ParagraphSection:CreateParagraph({
    Title = "2. Font Size Variations",
    Content = "Different font sizes: <font size='24'>Large Text (24px)</font>, <font size='16'>Medium Text (16px)</font>, <font size='12'>Small Text (12px)</font>.",
})

ParagraphSection:CreateParagraph({
    Title = "3. Font Colors",
    Content = "Colored text examples: <font color='#FF0000'>Red Text</font>, <font color='#00FF00'>Green Text</font>, <font color='#0000FF'>Blue Text</font>, <font color='#FFFF00'>Yellow Text</font>.",
})

ParagraphSection:CreateParagraph({
    Title = "4. Underline & Strikethrough",
    Content = "Text decorations: <u>Underlined text</u> and <s>Strikethrough text</s> for different emphasis styles.",
})

ParagraphSection:CreateParagraph({
    Title = "5. Combined Formatting",
    Content = "<b><i>Bold and Italic Together</i></b> with <font color='#FF69B4' size='18'>Pink Large Text</font> and <u><font color='#00FFFF'>Cyan Underlined</font></u>.",
})

ParagraphSection:CreateParagraph({
    Title = "6. Font Face Change",
    Content = "Different font faces: <font face='Arial'>Arial Font</font>, <font face='SourceSansPro'>Source Sans Pro</font>, <font face='Gotham'>Gotham Style</font>.",
})

ParagraphSection:CreateParagraph({
    Title = "7. Text Stroke/Border",
    Content = "Text with border effect: <stroke color='#000000' joins='true' thickness='2'>Black Stroke Text</stroke> and <stroke color='#FF0000' joins='true' thickness='3'>Red Thick Stroke</stroke>.",
})

ParagraphSection:CreateParagraph({
    Title = "8. Uppercase Styling",
    Content = "<b><font size='20' color='#FFA500'>UPPERCASE STYLED TEXT</font></b> with <i><font color='#800080'>purple italic lowercase</font></i> and normal text mix.",
})

ParagraphSection:CreateParagraph({
    Title = "9. Mixed Formatting Complex",
    Content = "<b>Bold</b> + <i>Italic</i> + <u>Underline</u> + <s>Strike</s> + <font color='#FF00FF' size='14'>Pink Size14</font> + <stroke joins='true' thickness='1' color='#FFFFFF'>White Stroke</stroke> all in one!",
})

ParagraphSection:CreateParagraph({
    Title = "10. Full Rich Text Demo",
    Content = "<font size='22' color='#FFD700'><b>GOLDEN HEADER</b></font>\n\n<font size='16' color='#00CED1'><i>Turquoise italic subtext</i></font>\n\nNormal text with <b>bold</b> and <u>underline</u>.\n\n<font color='#32CD32'>Green text</font> with <stroke joins='true' thickness='2' color='#006400'>Dark Green Stroke</stroke>.\n\n<u><font color='#FF1493' size='18'>Pink Underlined Large</font></u>",
})

ParagraphSection:CreateDivider({
    Text = "Divider with Text",
})

local ConfigSection = SettingsTab:CreateSection({
    Name = "Configuration",
    Icon = "database",
})

ConfigSection:CreateConfigManager({
    Name = "Config Manager",
})

ConfigSection:CreateThemeEditor({
    Name = "Theme Editor",
})

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

Window:Notify({
    Title = "Rawr Test UI Loaded!",
    Content = "All Bluesky features are now active with 2-column layouts and RichText formatting!",
    Type = "success",
    Duration = 5,
})

print("[Rawr.lua] All features loaded successfully!")
print("[Rawr.lua] Features enabled:")
print("  - 2-Column Layout for Labels and Cards")
print("  - 10 Card RichText formatting examples")
print("  - 10 Paragraph RichText formatting examples")
print("  - Full Lucide Roblox icons")
print("  - Discord integration")
print("  - Key System")
print("  - All UI components")
