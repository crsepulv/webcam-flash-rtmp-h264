# webcam-flash-rtmp-h264
in Browser RTMP streaming using the webcam, the encoding is using H264

Based on this tutotrial: http://www.adobe.com/devnet/adobe-media-server/articles/encoding-live-video-h264.html

##Intro

This code allows you to stream a single webcam (Audio&VIdeo) to a RTMP server like ADOBE, WOWZA, etc.

##Install

###swf/H264_Encoder.swf
is compiled from src/H264_send.as and is the object that allows the webcam streaming 
###swf/playerProductInstall.swf
in in case the user doesn't have flash installed. 

###send_h264.php
is where you configure the params and display it on browser.

actual configuration includes:

##Camera: 
( http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Camera.html )

###camera_bandwidth:"100000"
Specifies the maximum amount of bandwidth that the current outgoing video feed can use, in bytes per second. To specify that the video can use as much bandwidth as needed to maintain the value of quality, pass 0 for bandwidth. The default value is 16384.

###camera_quality:"0"
An integer that specifies the required level of picture quality, as determined by the amount of compression being applied to each video frame. Acceptable values range from 1 (lowest quality, maximum compression) to 100 (highest quality, no compression). To specify that picture quality can vary as needed to avoid exceeding bandwidth, pass 0 for quality.

###camera_fps:"30"
Frames per Second

###camera_KeyFrameInterval:"30"
The number of video frames transmitted in full (called keyframes) instead of being interpolated by the video compression algorithm. The default value is 15, which means that every 15th frame is a keyframe. A value of 1 means that every frame is a keyframe. The allowed values are 1 through 300.

###camera_loopback:"0"
Indicates whether a local view of what the camera is capturing is compressed and decompressed (true), as it would be for live transmission using Flash Media Server, or uncompressed (false).


##Microphone
( http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/media/Microphone.html)

###mic_codec:"SoundCodec.SPEEX"
The codec to use for compressing audio. Available codecs are Nellymoser (the default) and Speex. The enumeration class SoundCodec contains the various values that are valid for the codec property.

If you use the Nellymoser codec, you can set the sample rate using Microphone.rate(). If you use the Speex codec, the sample rate is set to 16 kHz.

Speex includes voice activity detection (VAD) and automatically reduces bandwidth when no voice is detected. When using the Speex codec, Adobe recommends that you set the silence level to 0. To set the silence level, use the Microphone.setSilenceLevel() method.

###mic_encodeQuality:"8"
The encoded speech quality when using the Speex codec. Possible values are from 0 to 10. The default value is 6. Higher numbers represent higher quality but require more bandwidth, as shown in the following table. The bit rate values that are listed represent net bit rates and do not include packetization overhead.

Quality value	Required bit rate (kilobits per second)
0	3.95
1	5.75
2	7.75
3	9.80
4	12.8
5	16.8
6	20.6
7	23.8
8	27.8
9	34.2
10	42.2


###mic_framesPerPacket:"2"
Number of Speex speech frames transmitted in a packet (message). Each frame is 20 ms long. The default value is two frames per packet.

The more Speex frames in a message, the lower the bandwidth required but the longer the delay in sending the message. Fewer Speex frames increases bandwidth required but reduces delay.


###mic_gain:"60"
The amount by which the microphone boosts the signal. Valid values are 0 to 100. The default value is 50.

###mic_noiseSuppressionLevel: "0"
Maximum attenuation of the noise in dB (negative number) used for Speex encoder. If enabled, noise suppression is applied to sound captured from Microphone before Speex compression. Set to 0 to disable noise suppression. Noise suppression is enabled by default with maximum attenuation of -30 dB. Ignored when Nellymoser codec is selected.



###mic_rate: "44"
The rate at which the microphone is capturing sound, in kHz. Acceptable values are 5, 8, 11, 22, and 44. The default value is 8 kHz if your sound capture device supports this value. Otherwise, the default value is the next available capture level above 8 kHz that your sound capture device supports, usually 11 kHz.

Note: The actual rate differs slightly from the rate value, as noted in the following table:

rate value	Actual frequency
44	44,100 Hz
22	22,050 Hz
11	11,025 Hz
8	8,000 Hz
5	5,512 Hz

###mic_silenceLevel: "0"
The amount of sound required to activate the microphone and dispatch the activity event. The default value is 10.

###mic_silenceTimeout: "5000"
The number of milliseconds between the time the microphone stops detecting sound and the time the activity event is dispatched. The default value is 2000 (2 seconds).

To set this value, use the Microphone.setSilenceLevel() method.

##desired functionalities

- Login/Passwd for stream authorization.
- Reconnect the stream if it lost connection with the server due to bandwith issues ( https://helpx.adobe.com/adobe-media-server/dev/reconnecting-streams-connection-drops.html)
- Webcam&mic selection via javascript to improve interface.
- Bandwith speedtest and other metrics to know if the stream is arriving well to the server.





