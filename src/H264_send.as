package
{
//	import flash.display.DisplayObject;
	
 	import flash.text.*; 
 	import flash.text.engine.*; 
	import flash.display.Sprite;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.Microphone;
	import flash.media.MicrophoneEnhancedOptions;
	import flash.media.MicrophoneEnhancedMode;
	import flash.media.SoundCodec;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	//import flash.text.TextField;
	
	[SWF( width="259", height="195" )]
	public class H264_send extends Sprite
	{
	//	private var vid_outDescription:TextField = new TextField();
		
		//Define a NetConnection variable nc
		private var nc:NetConnection;
		//Define two NetStream variables, ns_in and ns_out
		private var ns_out:NetStream;
		//Define a Camera variable cam
		private var cam:Camera = Camera.getCamera();
		private var mic:Microphone= Microphone.getEnhancedMicrophone();
		private var options:MicrophoneEnhancedOptions = new MicrophoneEnhancedOptions();
		//private var options:MicrophoneEnhancedOptions = new MicrophoneEnhancedOptions();
		//to get flashvars
		private var flashvars:Object = root.loaderInfo.parameters as Object;
		//Define a Video variable named vid_out
		private var vid_out:Video;
		//Define a Video variable named vid_in
		//Class constructor


		public function H264_send()
		{	
			//Call initConnection()
			initConnection();
		}
		
		//Called from class constructor, this function establishes a new NetConnection and listens for its status
		private function initConnection():void
		{
			//Create a new NetConnection by instantiating nc
			nc = new NetConnection();
			//Add an EventListener to listen for onNetStatus()
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			//Connect to the live folder on the server
			nc.connect(flashvars.urlStreaming);
			//Tell the NetConnection where the server should invoke callback methods
			nc.client = this;
			
			//Instantiate the vid_out variable, set its location in the UI, and add it to the stage
			vid_out = new Video(347,195);
			vid_out.x = -44; 
			vid_out.y = 0;
			vid_out.z = 0;
			addChild( vid_out );
		}
		
		//It's a best practice to always check for a successful NetConnection
		protected function onNetStatus(event:NetStatusEvent):void
		{
			//Trace the value of event.info.code
			trace( event.info.code );
			/*Check for a successful NetConnection, and if successful
			call publishCamera(), displayPublishingVideo(), and displayPlaybackVideo()*/
			if( event.info.code == "NetConnection.Connect.Success" )
			{ 
				publishCamera(); 
				displayPublishingVideo(); 
			}
		}
		
		//The encoding settings are set on the publishing stream
		protected function publishCamera():void
		{
			//Instantiate the ns_out NetStream
			ns_out = new NetStream( nc );
			//Attach the camera to the outgoing NetStream
			ns_out.attachCamera( cam );
			ns_out.attachAudio( mic );
			//Define a local variable named h264Settings of type H264VideoStreamSettings
			var h264Settings:H264VideoStreamSettings = new H264VideoStreamSettings();
			//Set encoding profile and level on h264Settings
			h264Settings.setProfileLevel(H264Profile.MAIN,H264Level.LEVEL_5_1);
			//Set the bitrate and quality settings on the Camera object
			cam.setQuality( flashvars.camera_bandwidth, flashvars.camera_quality );
			//Set the video's  width,height,  fps, and whether it should maintain its capture size
			cam.setMode( 347,195,flashvars.camera_fps , true );
			//Set the keyframe interval
			cam.setKeyFrameInterval( 15 );
			
			
			mic.setLoopBack(false);
			mic.gain = flashvars.mic_gain;
			mic.setSilenceLevel(flashvars.mic_silenceLevel,flashvars.mic_silenceTimeout);
			mic.codec= SoundCodec.SPEEX;	
			mic.encodeQuality=flashvars.mic_encodeQuality;
			mic.framesPerPacket= flashvars.mic_framesPerPacket;
			mic.noiseSuppressionLevel=flashvars.mic_noiseSuppressionLevel;
			mic.rate= flashvars.mic_rate;
			options.mode = MicrophoneEnhancedMode.FULL_DUPLEX;
			options.echoPath = 128;
			options.nonLinearProcessing = true;
			

			
			
			
			
			//Set the outgoing video's compression settings based on h264Settings
			ns_out.videoStreamSettings = h264Settings;
			
			//Publish the outgoing stream
			ns_out.publish( flashvars.streamName, "live" );
			//Declare the metadata variable
			var metaData:Object = new Object();
			//Give the metadata object properties to reflect the stream's metadata
			metaData.codec = mic.codec;
			metaData.profile =  h264Settings.profile;
			metaData.level = h264Settings.level;
			metaData.fps = cam.fps;
			metaData.bandwith = cam.bandwidth;
			metaData.height = cam.height;
			metaData.width = cam.width;
			metaData.keyFrameInterval = cam.keyFrameInterval;
			//Call send() on the ns_out NetStream
			ns_out.send( "@setDataFrame", "onMetaData", metaData );
			
		/*	display text feedback
		
			
			var myTextBox:TextField = new TextField(); 
			 var myText:String = mic.codec; 		
			 var format:ElementFormat = new ElementFormat(); 
			 var textElement:TextElement = new TextElement(myText, format); 
			 var textBlock:TextBlock = new TextBlock(); 
			 textBlock.content = textElement; 
			 var textLine1:TextLine = textBlock.createTextLine(null, 300); 
			 
			 textLine1.x = 30; 
			 textLine1.y = 30; 
			 textLine1.z = 1; 
			 addChild(textLine1);
		/**/	
			  
		}
		
		//Display the outgoing video stream in the UI
		protected function displayPublishingVideo():void
		{
			//Attach the incoming video stream to the vid_out component
			vid_out.attachCamera( cam );
		}
		
		//Display the incoming video stream in the UI
		
		//Necessary callback function that checks bandwith (remains empty in this case)
		public function onBWDone():void
		{
		}
		
		//Display stream metadata and lays out visual components in the UI
		
		
		
		
		
		
		
	}	 
}