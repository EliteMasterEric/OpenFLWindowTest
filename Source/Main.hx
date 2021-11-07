package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.MouseEvent;

class Main extends Sprite {
	public var drag:Bool;
	public var offsetX:Int;
	public var offsetY:Int;

	public function new() {
		super();
		var bitmap = new Bitmap(Assets.getBitmapData("assets/openfl.png"));

		bitmap.x = (stage.stageWidth - bitmap.width) / 2;
		bitmap.y = (stage.stageHeight - bitmap.height) / 2;
		// stage.alpha=0; //making it 0 will make everything disappear
		// stage.opaqueBackground=0;
		// stage.color=0x000000;
		// stage.color=null;

		addChild(bitmap);

		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
	}

	function mouseDown(event:MouseEvent) {
		offsetX = Std.int(event.localX);
		offsetY = Std.int(event.localY);
		drag = true;
	}

	function mouseUp(event:MouseEvent) {
		drag = false;
	}

	function mouseMove(event:MouseEvent) {
		if (drag) {
			var winX = Lib.application.window.x;
			var winY = Lib.application.window.y;

			Lib.application.window.move(winX + Std.int(event.localX) - offsetX, winY + Std.int(event.localY) - offsetY);
		}
	}
}
