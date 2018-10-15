Command pattern

￼
<img width="500" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/commandpattern.png">

- The Invoker call command.execute() then the command (which has the logic) operates on the Reciver instance. the reciver can be a Textfield
- Encapsulated functionality and then can invoc them in a sequence.
- Often used to add undo and redo. Functionality
- The command pattern allows a client to issue requests to an object without making any assumptions about the request, 
or the receiving object. Think of the request as a command sent to an object to engage in a known behavior.

Key Features of the Command Pattern:
- The primary usefulness of the command pattern is the flexibility and extensibility it affords when defining behavior in applications.
- The command pattern encapsulates behavior in a portable command object.
- The command pattern decouples the classes and which methods in those classes execute required behavior from the location where the behavior is called.
- Thecommandpatternallowsaclienttodynamicallycreatenewbehaviorbycre- ating new command objects and assigning them to invokers at runtime.
- The command pattern allows for straightforward implementation of command chaining, undo, redo and logging features into an application.


Key OOP Concepts in the Command Pattern
The key concept in the command pattern is encapsulation. Encapsulation is basi- cally information hiding. 
You want to hide implementation details of parts of a pro- gram that are most likely to change from other parts.
Command objects, which are instances of concrete commands, embed behavior. 
However, which classes execute that behavior and which methods in those classes implement that behavior are hidden from where the behavior is called. 
This informa- tion is encapsulated within the command object.
We saw in the minimalist example that nowhere in the invoker (Example 7-4) is the type of the receiver mentioned. 
The invoker only knows what’s implemented in the command interface (Example 7-1). It only knows that the command object has a method called execute( ). 
All the invoker knows is to call that method in the com- mand object when it’s time to do it.
This decouples the invoker from the receiver. If it becomes necessary to use a differ- ent receiver to implement a required behavior, 
we can modify the concrete com- mand to delegate to a different receiver. The invoker won’t know that anything has changed; 
it’ll keep calling the execute() command in the same command object, oblivious to the fact that its behavior is now implemented using a different receiver.


### basic

Simple example of the Command pattern that illustrates the realtionship between Command, Reciver and invoker:

```java
interface ICommand { 
	function execute():void;
} 
class ConcreteCommand implements ICommand {
	var receiver:Receiver;
	public function ConcreteCommand(rec:Receiver):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.action(); 
	}
}
class Receiver {
	public function action() {
		trace("Receiver: doing action");
	}
} 
class Invoker {
	var currentCommand:ICommand;
	public function setCommand(c:ICommand):void {
		this.currentCommand = c;
	}
	public function executeCommand() {
		currentCommand.execute(); 
	}
} 
class Main {
	public function Main() {
		var rec:Receiver = new Receiver();
		var concCommand:ICommand = new ConcreteCommand(rec);
	
		var invoker:Invoker = new Invoker();
		invoker.setCommand(concCommand);
		Invoker.executeCommand(); // execute command
	}
}
//Output:
//Receiver: doing action

```

### Timer

Simple Command pattern example that uses a TimedInvoker to envoke commands:
```java

interface ICommand { 
	function execute():void;
} 
class ConcreteCommand implements ICommand {
	var receiver:Receiver;
	public function ConcreteCommand(rec:Receiver):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.action(); 
	}
}
class Receiver {
	public function action() {
		trace("Receiver: doing action");
	}
} 
class Invoker {
	var currentCommand:ICommand;
	public function setCommand(c:ICommand):void {
		this.currentCommand = c;
	}
	public function executeCommand() {
		currentCommand.execute(); 
	}
} 
class TimedInvoker extends Invoker {
	public function setTimer() {
		var timer:Timer = new Timer(1000, 5); 
		timer.addEventListener(TimerEvent.TIMER, this.onTimerEvent); 
		timer.start();
	}
	public function onTimerEvent(evt:TimerEvent):void { 
		this.executeCommand();
	} 
}
class Test2 {
	public function Test2() {
		var rec:Receiver = new Receiver();
		var concCommand:ICommand = new ConcreteCommand(rec);
	
		var invoker:TimedInvoker = new TimedInvoker(); 
		invoker.setCommand(concCommand);
		invoker.setTimer();
	}
}
//This will cause the command to be executed every second for 5 seconds based on timer events. 
//This is a more accurate representation of the command pattern where the invoker executes commands based on different triggers, independent of the client.

```


### Macro
Command pattern example that illustrates how to envoke commands that has subCommands (Macro commands)
```java


interface ICommand { 
	function execute():void;
}
class Invoker {
	var currentCommand:ICommand;
	public function setCommand(c:ICommand):void {
		this.currentCommand = c;
	}
	public function executeCommand() {
		currentCommand.execute(); 
	}
} 
class TimedInvoker extends Invoker {
	public function setTimer() {
		var timer:Timer = new Timer(1000, 5); 
		timer.addEventListener(TimerEvent.TIMER, this.onTimerEvent); 
		timer.start();
	}
	public function onTimerEvent(evt:TimerEvent):void { 
		this.executeCommand();
	} 
}
interface IMacroCommand extends ICommand {
	function add(c:ICommand):void;
	function remove(c:ICommand):void;
}
class ConcreteCommand1 implements ICommand {
	var receiver:Receiver1;
	public function ConcreteCommand1(rec:Receiver1):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.action1(); 
	}
}
class ConcreteCommand2 implements ICommand {
	var receiver:Receiver2;
	public function ConcreteCommand2(rec:Receiver2):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.action2(); 
	}
}
class Receiver1 {
	public function action1() { 
		trace("Receiver 1: doing action 1");
	} 
}
class Receiver2 {
	public function action2() { 
		trace("Receiver 2: doing action 2");
	} 
}
class ConcreteMacroCommand implements IMacroCommand {
	var commandObjectList:Array;
	public function ConcreteMacroCommand() {
		this.commandObjectList = new Array(); 
	}
	public function add(c:ICommand):void {
		commandObjectList.push(c);
	}
	public function remove(c:ICommand):void {
		for (var i:int = 0;i < commandObjectList.length;i++) {
			if (commandObjectList[i] === c) {
				commandObjectList.splice(i, 1);
				break; 
			}
		} 
	}
	public function execute():void {
		for (var i:int = 0;i < commandObjectList.length;i++) {
			commandObjectList[i].execute(); 
		}
	} 
}
class Test {
	public function Test() {
		var command1:ICommand = new ConcreteCommand1(new Receiver1()); 
		var command2:ICommand = new ConcreteCommand2(new Receiver2());
		// create a macro command and add commands
		var macroCommand:IMacroCommand = new ConcreteMacroCommand(); 
		macroCommand.add(command1);
		macroCommand.add(command2);
		var invoker:TimedInvoker = new TimedInvoker(); // assign macro command to the invoker invoker.setCommand(macroCommand);
		// invoke commands on timer events invoker.setTimer( );
	}
}
//Output:
//Receiver 1: doing action 1
//Receiver 2: doing action 2
//5 seconds later: 
//Receiver 1: doing action 1
//Receiver 2: doing action 2
//and so on..
```


### Buttons:

```java
This example isnt very good, but it assigns 2 buttons to a list and 2 commands to another and then their dependent on eachother like a pair list.
interface ICommand { 
	function execute():void;
}
class IncrementCommand implements ICommand {
	var receiver:TextField;
	public function IncrementCommand(rec:TextField):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.text = String(Number(receiver.text) + 1);
	} 
}
class DecrementCommand implements ICommand {
	var receiver:TextField;
	public function DecrementCommand(rec:TextField):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.text = String(Number(receiver.text) - 1);
	}
}
class InvokerPanel extends Sprite {
	private var commandList:Array; 
	private var buttonList:Array;
	public function InvokerPanel() {
		this.commandList = new Array(5);
		this.buttonList = new Array(5); 
	}
	public function setCommand(nSlot:int, c:ICommand):void {
		this.commandList[nSlot] = c; 
	}
	public function setButton(nSlot:int, sName:String):void {
		var btn:TextButton = new TextButton(sName); 
		this.buttonList[nSlot] = btn;
		btn.x = nSlot * 100;
		btn.addEventListener(MouseEvent.CLICK, this.buttonClicked); 
		this.addChild(btn);
	}
	private function buttonClicked(e:Event) {
		for (var i:int = 0;i < buttonList.length;i++) {
			if (buttonList[i] === e.target) {
				this.commandList[i].execute();
				break;
			}
		}
	}
}
class Test extends Sprite{
	public function Test() {
		// create new receiver
		var numDisplayField:TextField = new TextField();
		numDisplayField.autoSize = TextFieldAutoSize.LEFT;
		numDisplayField.text = '100'; // default value
		numDisplayField.border = true;
		numDisplayField.x = 50;
		numDisplayField.y = 50;
		this.addChild(numDisplayField);
		
		// concrete command objects
		var incCommand:ICommand = new IncrementCommand(numDisplayField);
		var decCommand:ICommand = new DecrementCommand(numDisplayField);
		
		// create invoker button panel
		var panel:InvokerPanel = new InvokerPanel();
		panel.setButton(0, "+1");
		panel.setButton(1, "-1");
		panel.x = 50;
		
		panel.y = 100;
		this.addChild(panel);
		
		// add commands to invoker buttons
		panel.setCommand(0, incCommand);
		panel.setCommand(1, decCommand);	
	}
}
```


### Keyboard:

```java
Keyboard invoker 

interface ICommand { 
	function execute():void;
}
class IncrementCommand implements ICommand {
	var receiver:TextField;
	public function IncrementCommand(rec:TextField):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.text = String(Number(receiver.text) + 1);
	} 
}
class DecrementCommand implements ICommand {
	var receiver:TextField;
	public function DecrementCommand(rec:TextField):void {
		this.receiver = rec;
	}
	public function execute():void {
		receiver.text = String(Number(receiver.text) - 1);
	}
}
class InvokerKeyboard {
	var commandList:Array;
	var keyList:Array;
	public function InvokerKeyboard(stageTarget:Stage) {
		this.commandList = new Array();
		this.keyList = new Array(); 
		stageTarget.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPress);
	}
	public function setCommand(keycode:int, c:ICommand):void {
		this.keyList.push(keycode);
		this.commandList.push(c);
	}
	private function onKeyPress(event:KeyboardEvent) {
		for (var i:int = 0;i < keyList.length;i++) {
			if (keyList[i] === event.keyCode) {
				this.commandList[i].execute();
				break; 
			}
		} 
	}
}
class Test extends Sprite{
	public function Test() {
		// create new receiver
		var numDisplayField:TextField = new TextField();
		numDisplayField.autoSize = TextFieldAutoSize.LEFT;
		numDisplayField.text = '100'; // default value
		numDisplayField.border = true;
		numDisplayField.x = 50;
		numDisplayField.y = 50;
		this.addChild(numDisplayField);
		
		// concrete command objects
		var incCommand:ICommand = new IncrementCommand(numDisplayField);
		var decCommand:ICommand = new DecrementCommand(numDisplayField);
		
		var kb:InvokerKeyboard = new InvokerKeyboard(this.stage);
	     // add commands to keyboard shortcut invoker
	     kb.setCommand(Keyboard.RIGHT, incCommand);
	     kb.setCommand(Keyboard.LEFT, decCommand);
	     kb.setCommand(Keyboard.NUMPAD_ADD, incCommand);
	     kb.setCommand(Keyboard.NUMPAD_SUBTRACT, decCommand);	
	}
}
```

### undo

```java
Example that illustrates a simple use of undo and redo:

interface ICommand { 
	function execute():void;
}
class CommandWithUndo implements ICommand {
	// ABSTRACT Class (should be subclassed and not instantiated)
	internal static var aCommandHistory:Array = new Array();//Static subclass access
	public function execute():void {
		aCommandHistory.push(this);
	}
	public function undo():void {
		// ABSTRACT Method (must be overridden in a subclass)
	} 
}
class IncrementCommandWithUndo extends CommandWithUndo {
	var receiver:TextField;
	public function IncrementCommandWithUndo(rec:TextField):void {
		this.receiver = rec;
	}
	override public function execute():void {
		receiver.text = String(Number(receiver.text) + 1);
		super.execute();
	}
	override public function undo():void {
		receiver.text = String(Number(receiver.text) - 1);
	}
} 
class DecrementCommandWithUndo extends CommandWithUndo {
	var receiver:TextField;
	public function DecrementCommandWithUndo(rec:TextField):void {
		this.receiver = rec;
	}
	override public function execute():void {
		receiver.text = String(Number(receiver.text) - 1);
		super.execute(); 
	}
	override public function undo():void {
		receiver.text = String(Number(receiver.text) + 1);
	}
} 
class UndoLastCommand extends CommandWithUndo {
	override public function execute():void {
		if (aCommandHistory.length) {
			var lastCommand:CommandWithUndo = aCommandHistory.pop();
			lastCommand.undo(); 
		}
	}
	override public function undo():void {
		throw new IllegalOperationError("undo operation not supported
                on this command");
	} 
}
class InvokerPanel extends Sprite {
	private var commandList:Array; 
	private var buttonList:Array;
	public function InvokerPanel() {
		this.commandList = new Array(5);
		this.buttonList = new Array(5); 
	}
	public function setCommand(nSlot:int, c:ICommand):void {
		this.commandList[nSlot] = c; 
	}
	public function setButton(nSlot:int, sName:String):void {
		var btn:TextButton = new TextButton(sName); 
		this.buttonList[nSlot] = btn;
		btn.x = nSlot * 100;
		btn.addEventListener(MouseEvent.CLICK, this.buttonClicked); 
		this.addChild(btn);
	}
	private function buttonClicked(e:Event) {
		for (var i:int = 0;i < buttonList.length;i++) {
			if (buttonList[i] === e.target) {
				this.commandList[i].execute();
				break;
			}
		}
	}
}
class Test {
	public function Test() {
		// create new receiver
		var numDisplayField:TextField = new TextField();
		numDisplayField.autoSize = TextFieldAutoSize.LEFT;
		numDisplayField.text = '100'; // default value
		numDisplayField.border = true;
		numDisplayField.x = 50;
		numDisplayField.y = 50;
		this.addChild(numDisplayField);

		// create concrete commands
		var incCommand:CommandWithUndo = new IncrementCommandWithUndo(numDisplayField);
		var decCommand:CommandWithUndo = new DecrementCommandWithUndo(numDisplayField);
		var undo:CommandWithUndo = new UndoLastCommand();

		// create invoker button
		var panel:InvokerPanel = new InvokerPanel();
		panel.setButton(0, "+1");
		panel.setButton(1, "-1");
		panel.setButton(2, "Undo");
		panel.x = 50;
		panel.y = 100;
		this.addChild(panel);

		// add commands to invoker
		panel.setCommand(0, incCommand);
		panel.setCommand(1, decCommand);
		panel.setCommand(2, undo);
	}
}
```

### Radio player

```java
This example illustrates how to Dynamicly distribute different commands to buttons based on the change of generes. (How ever i think this could be easier done with a StateMachine)

/*
<?xml version=“1.0” encoding=“utf-8”?>
<rss version=“2.0”>
<channel>
<title>10AM ET News Summary</title>
<item>
<title>News Summary for Saturday, Nov 18 2006 at 10:00 AM EST</title>
<pubDate>Sat, 18 Nov 2006 10:16:06 EST</pubDate>
<enclosure url=“http://news.podcasts.org/6507084.mp3”>
</item>
</channel>
</rss>
 */
interface ICommand { 
	function execute():void;
}
class PlayPodcastCommand implements ICommand {
	var receiver:Radio;
	var podCastURL:String;
	public function PlayPodcastCommand(rec:Radio, url:String):void {
		this.receiver = rec;
		this.podCastURL = url;
	}
	public function execute():void {
		this.receiver.playPodcast(this.podCastURL);
	}
}
class SetToMusicGenreCommand implements ICommand {
	var receiver:DynamicControlButtons;
	public function SetToMusicGenreCommand(rec:ControlButtons):void {
		this.receiver = rec;
	}
	public function execute():void {
		this.receiver.setGenre(DynamicControlButtons.MUSIC);
	} 
}
class SetToNewsGenreCommand implements ICommand {
	var receiver:DynamicControlButtons;
	public function SetToNewsGenreCommand(rec:ControlButtons):void {
		this.receiver = rec;
	}
	public function execute():void {
		this.receiver.setGenre(DynamicControlButtons.NEWS);
	}
}
class ControlButtons extends Sprite {
	protected var commandList:Array;
	var buttonList:Array;
	public function ControlButtons() {
		this.commandList = new Array(5);
		this.buttonList = new Array(5);
	}
	public function setCommand(nSlot:int, c:ICommand):void {
		this.commandList[nSlot] = c;
	}
	public function setButton(nSlot:int, sName:String):void {
		var btn:TextButton = new TextButton(sName);
		this.buttonList[nSlot] = btn;
		btn.x = nSlot * 100;
		btn.addEventListener(MouseEvent.CLICK, this.buttonClicked);
		this.addChild(btn);
	}
	private function buttonClicked(e:Event):void {
		for (var i:int = 0;i < buttonList.length;i++) {
			if (buttonList[i] === e.target) {
				this.commandList[i].execute();
				break; 
			}
		} 
	}
}
class DynamicControlButtons extends ControlButtons {
	public static const NEWS:uint = 0;
	public static const MUSIC:uint = 1;
	var currentGenre:uint = NEWS;
	var newsPodcastCommands:Array;
	var musicPodcastCommands:Array;
	public function DynamicControlButtons() {
		this.newsPodcastCommands = new Array(3);
		this.musicPodcastCommands = new Array(3);
	}
	public function setGenre(genre:uint):void {
		if (genre == NEWS) {
			this.currentGenre = NEWS;
		} else if (genre == MUSIC) {
			this.currentGenre = MUSIC;
		}
		this.updateCommandButtons();
	}
	public function setGenreCommand(nSlot:int, c:ICommand, genre:uint):void {
		if (genre == NEWS) {
			this.newsPodcastCommands[nSlot] = c;
		} else if (genre == MUSIC) {
			this.musicPodcastCommands[nSlot] = c;
		}
		this.updateCommandButtons();
	}
	private function updateCommandButtons():void {
		for(var i:int = 0;i < 3;i++) {
			if (currentGenre == NEWS) {
				this.commandList[i] = this.newsPodcastCommands[i];
			} else if (currentGenre == MUSIC) {
				this.commandList[i] = this.musicPodcastCommands[i];
			}
		}
	}
}
class TextDisplayField extends TextField {
	public function TextDisplayField(labelText:String = “”,
                                    fontSize:int = 14,
                                    showborder:Boolean = true) {
		autoSize = TextFieldAutoSize.LEFT;
		text = labelText;
		border = showborder;
		var format:TextFormat = new TextFormat(“Verdana”);
		format.size = fontSize;
		setTextFormat(format);
	} 
}
class Radio extends Sprite {
	private var audioDisplay:TextDisplayField;
	private static var audioChannel:SoundChannel = new SoundChannel(); 
	var xmlLoader:URLLoader;
	public function Radio() {
		audioDisplay = new TextDisplayField(“click button to play”, 14);
		this.addChild(audioDisplay); 
	}
	public function playPodcast(url:String):void {
		var xmlURL:URLRequest = new URLRequest(url);
		this.xmlLoader = new URLLoader(xmlURL);
		xmlLoader.addEventListener(Event.COMPLETE, xmlLoaded);
		xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, loadError);
	}
	private function xmlLoaded(evtObj:Event):void {
		var xml:XML = new XML();
		xml = XML(xmlLoader.data);
		// set the default XML namespace to the source if (xml.namespace(“”) != undefined)
		{
		default xml namespace = xml.namespace(“”);
		}
		// set the display field to audio stream name
		this.audioDisplay.text = xml..item[0].title;
		// get audio url
		var url:* = xml..item[0].enclosure.attribute(“url”);
		// load audio and play
		var request:URLRequest = new URLRequest(url);
		var audio:Sound = new Sound();
		audio.addEventListener(IOErrorEvent.IO_ERROR, loadError);
		audio.load(request);
		audioChannel.stop(); // stop previous audio
		audioChannel = audio.play();
	}
	private function loadError(event:Event):void {
		trace(“Load error “ + event);
	}
}
class Test extends Sprite {
	public function Test() {
		// create radio (receiver)
		var radio:Radio = new Radio(); 
		radio.x = 50;
		radio.y = 50; 
		this.addChild(radio);
		// create control buttons (invoker)
		var controls:DynamicControlButtons = new DynamicControlButtons(); 
		controls.setButton(0, “1”);
		controls.setButton(1, “2”);
		controls.setButton(2, “3”);
		controls.setButton(3, “News”);
		controls.setButton(4, “Music”);
		controls.x = 50;
		controls.y = this.stage.stageHeight - 50; 
		this.addChild(controls);
		// podcast URLs
		var podcastNewsURL_1:String = “http://www.npr.org/rss/podcast.php?id=500005”;
		var podcastNewsURL_2:String = “http://rss.cnn.com/services/podcasting/newscast/rss.xml”;
		var podcastNewsURL_3:String = “http://www.npr.org/rss/podcast.php?id=510053”;
		var podcastMusicURL_1:String = “http://www.npr.org/rss/podcast.php?id=510019”;
		var podcastMusicURL_2:String = “http://www.npr.org/rss/podcast.php?id=510026”;
		var podcastMusicURL_3:String = “http://minnesota.publicradio.org/tools/podcasts/new_classical_tracks.xml”;
		// add station commands to invoker buttons
		controls.setGenreCommand(0, new PlayPodcastCommand(radio, podcastNewsURL_1), DynamicControlButtons.NEWS);
		controls.setGenreCommand(1, new PlayPodcastCommand(radio, podcastNewsURL_2), DynamicControlButtons.NEWS);
		controls.setGenreCommand(2, new PlayPodcastCommand(radio, podcastNewsURL_3), DynamicControlButtons.NEWS);
		controls.setGenreCommand(0, new PlayPodcastCommand(radio, podcastMusicURL_1), DynamicControlButtons.MUSIC);
		controls.setGenreCommand(1, new PlayPodcastCommand(radio, podcastMusicURL_2), DynamicControlButtons.MUSIC);
		controls.setGenreCommand(2, new PlayPodcastCommand(radio, podcastMusicURL_3), DynamicControlButtons.MUSIC);
		// add genre selection commands to invoker buttons
		controls.setCommand(3, new SetToNewsGenreCommand(controls));
		controls.setCommand(4, new SetToMusicGenreCommand(controls));
	}
}
```


