--set logical dimensions (always like these, no matter if portrait or lanscape)
application:setLogicalDimensions(320, 480)
--set orientation
application:setOrientation(Application.PORTRAIT)
--set scaling mode
application:setScaleMode("letterbox")

--screen size
screenW = application:getContentWidth()
screenH = application:getContentHeight()

--use absolute positioning
dx = application:getLogicalTranslateX() / application:getLogicalScaleX()
dy = application:getLogicalTranslateY() / application:getLogicalScaleY()

sceneManager = SceneManager.new({
	["InGame"]=InGame,
	})
	
stage:addChild(sceneManager)
sceneManager:changeScene("InGame",1, sceneManager.crossfade)