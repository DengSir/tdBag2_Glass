-- tdBag2_Glass.lua
-- @Author : Dencer (tdaddon@163.com)
-- @Link   : https://dengsir.github.io
-- @Date   : 4/25/2020, 3:07:22 AM

local Addon = tdBag2
if not Addon then
    return
end

local BORDER_COLORS = {
    bag = {r = 1, g = 1, b = 1},
    bank = {r = 1, g = 0.82, b = 0},
    mail = {r = 1, g = 0.5, b = 0.5},
    equip = {r = 0, g = 1, b = 0},
    ['global-search'] = {r = 0, g = 1, b = 1},
}

Addon:RegisterStyle('Glass', {
    overrides = {
        ItemBase = {EMPTY_SLOT_TEXTURE = [[]]},

        Frame = { --
            TEMPLATE = 'tdBag2GlassBaseFrameTemplate',

            UpdateBorder = function(self)
                local color = BORDER_COLORS[self.meta.bagId]
                self:SetBackdropBorderColor(color.r, color.g, color.b)
            end,
        },
        PluginFrame = { --
            BUTTON_TEMPLATE = 'tdBag2GlassToggleButtonTemplate',
            SPACING = 2,
        },
        TitleContainer = { --
            SCROLL_TEMPLATE = 'tdBag2GlassScrollFrameTemplate',
        },

        ContainerFrame = {
            TEMPLATE = 'tdBag2GlassFrameTemplate',

            PlaceSearchBox = function(self)
                self.SearchBox:Show()

                if self.BagFrame:IsShown() then
                    self.SearchBox:SetPoint('RIGHT', self.BagFrame, 'LEFT', -6, 0)
                else
                    self.SearchBox:SetPoint('RIGHT', self, 'TOPRIGHT', -6, -45)
                end
            end,
        },
    },

    hooks = {
        GlobalSearchFrame = {
            Constructor = function(self, ...)
                self.TitleFrame:SetPoint('TOPLEFT', 8, -8)
            end,
        },
        SearchBox = {
            Constructor = function(self)
                local color = BORDER_COLORS[self.meta.bagId]
                self:SetBackdropBorderColor(color.r, color.g, color.b)
            end
        }
    },
})
