display.setDefault( 'magTextureFilter', 'nearest' )
display.setDefault( 'minTextureFilter', 'nearest' )

local skinModule = require('skin')
local playerSkin = skinModule.newSkin('Jotaro Kujo.png')

local head = display.newGroup()
head.x = display.contentCenterX
head.y = display.contentCenterY
head:scale(16, 16)

local face = playerSkin:get('head', 'front')
head:insert(face)

local hat = playerSkin:get('head', 'front', true)
head:insert(hat)
