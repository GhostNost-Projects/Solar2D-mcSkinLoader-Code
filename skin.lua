local M = {}

function M.newSkin( imagePath )
    local options = {
        frames = {
            -- HEAD --
            { x = 8,  y = 0, width = 8, height = 8 },
            { x = 16, y = 0, width = 8, height = 8 },
            { x = 0,  y = 8, width = 8, height = 8 },
            { x = 8,  y = 8, width = 8, height = 8 },
            { x = 16, y = 8, width = 8, height = 8 },
            { x = 24, y = 8, width = 8, height = 8 },

            { x = 40, y = 0, width = 8, height = 8 },
            { x = 48, y = 0, width = 8, height = 8 },
            { x = 32, y = 8, width = 8, height = 8 },
            { x = 40, y = 8, width = 8, height = 8 },
            { x = 48, y = 8, width = 8, height = 8 }, 
            { x = 56, y = 8, width = 8, height = 8 },

            -- BODY --
            { x = 20, y = 16, width = 8, height = 4 },
            { x = 28, y = 16, width = 8, height = 4 },
            { x = 16, y = 20, width = 4, height = 12 },
            { x = 20, y = 20, width = 8, height = 12 },
            { x = 28, y = 20, width = 4, height = 12 },
            { x = 32, y = 20, width = 8, height = 12 },

            { x = 20, y = 32, width = 8, height = 4 },
            { x = 28, y = 32, width = 8, height = 4 },
            { x = 16, y = 36, width = 4, height = 12 },
            { x = 20, y = 36, width = 8, height = 12 },
            { x = 28, y = 36, width = 4, height = 12 },
            { x = 32, y = 36, width = 8, height = 12 },

            -- RIGHT ARM --
            { x = 44, y = 16, width = 4, height = 4 },
            { x = 48, y = 16, width = 4, height = 4 },
            { x = 40, y = 20, width = 4, height = 12 },
            { x = 44, y = 20, width = 4, height = 12 },
            { x = 48, y = 20, width = 4, height = 12 },
            { x = 52, y = 20, width = 4, height = 12 },

            { x = 44, y = 32, width = 4, height = 4 },
            { x = 48, y = 32, width = 4, height = 4 },
            { x = 40, y = 36, width = 4, height = 12 },
            { x = 44, y = 36, width = 4, height = 12 },
            { x = 48, y = 36, width = 4, height = 12 },
            { x = 52, y = 36, width = 4, height = 12 },

            -- LEFT ARM --
            { x = 36, y = 48, width = 4, height = 4 },
            { x = 40, y = 48, width = 4, height = 4 },
            { x = 32, y = 52, width = 4, height = 12 },
            { x = 36, y = 52, width = 4, height = 12 },
            { x = 40, y = 52, width = 4, height = 12 },
            { x = 44, y = 52, width = 4, height = 12 },

            { x = 52, y = 48, width = 4, height = 4 },
            { x = 56, y = 48, width = 4, height = 4 },
            { x = 48, y = 52, width = 4, height = 12 },
            { x = 52, y = 52, width = 4, height = 12 },
            { x = 56, y = 52, width = 4, height = 12 },
            { x = 60, y = 52, width = 4, height = 12 },

            -- RIGHT LEG --
            { x = 4, y = 16, width = 4, height = 4 },
            { x = 8, y = 16, width = 4, height = 4 },
            { x = 0, y = 20, width = 4, height = 12 },
            { x = 4, y = 20, width = 4, height = 12 },
            { x = 8, y = 20, width = 4, height = 12 },
            { x = 12, y = 20, width = 4, height = 12 },

            { x = 4, y = 32, width = 4, height = 4 },
            { x = 8, y = 32, width = 4, height = 4 },
            { x = 0, y = 36, width = 4, height = 12 },
            { x = 4, y = 36, width = 4, height = 12 },
            { x = 8, y = 36, width = 4, height = 12 },
            { x = 12, y = 36, width = 4, height = 12 },

            -- LEFT LEG --
            { x = 20, y = 48, width = 4, height = 4 },
            { x = 24, y = 48, width = 4, height = 4 },
            { x = 16, y = 52, width = 4, height = 12 },
            { x = 20, y = 52, width = 4, height = 12 },
            { x = 24, y = 52, width = 4, height = 12 },
            { x = 28, y = 52, width = 4, height = 12 },

            { x = 4, y = 48, width = 4, height = 4 },
            { x = 8, y = 48, width = 4, height = 4 },
            { x = 0, y = 52, width = 4, height = 12 },
            { x = 4, y = 52, width = 4, height = 12 },
            { x = 8, y = 52, width = 4, height = 12 },
            { x = 12, y = 52, width = 4, height = 12 }
        }
    }

    local sheet = graphics.newImageSheet( imagePath, options )

    local sideOffsets = {
        top = 0,
        bottom = 1,
        right = 2,
        front = 3,
        left = 4,
        back = 5
    }

    local baseIds = {
        head = 1,
        body = 13,
        rightArm = 25,
        leftArm = 37,
        rightLeg = 49,
        leftLeg = 61
    }

    local skinInstance = {
        sheet = sheet,
        options = options,
        upper = {}
    }

    local function createPart( partName, sideName, isUpper )
        local startId = baseIds[partName]
        local sideOffset = sideOffsets[sideName]

        if not startId or not sideOffset then
            return nil
        end

        local frameId = startId + sideOffset

        if isUpper then
            frameId = frameId + 6
        end

        local frame = options.frames[frameId]
        local img = display.newImageRect( sheet, frameId, frame.width, frame.height )

        return img
    end

    function skinInstance:get( partName, sideName, isUpper )
        isUpper = isUpper or false
        return createPart( partName, sideName, isUpper )
    end

    return skinInstance
end

return M
