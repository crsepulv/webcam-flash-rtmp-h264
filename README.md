# webcam-flash-rtmp-h264
in Browser RTMP streaming using the webcam, the encoding is using H264

Based on this tutotrial: http://www.adobe.com/devnet/adobe-media-server/articles/encoding-live-video-h264.html

##Intro

This code allows you to stream a single webcam (Audio&VIdeo) to a RTMP server like ADOBDE FMS, WOWZA, etc.

##Instalation

swf/H264_Encoder.swf is compiled from src/H264_send.as and is the object that allows the webcam streaming 
swf/playerProductInstall.swf in in case the user doesn't have flash installed. 
send_h264.php is where you configure the params and display it on browser.
