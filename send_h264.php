<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> 
<head>
<script type="text/javascript" src="js/h264_swfobject.js"></script>





 
<script type="text/javascript">
function  setupFlash() {

            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = "11.4.0";
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = "swf/playerProductInstall.swf";
            var flashvars = {
                 urlStreaming: "rtmp://[server]/[app]",
                streamName: "[streamName]",
                camera_bandwidth:"100000",//Specifies the maximum amount of bandwidth that the current outgoing video feed can use, in bytes per second. To specify that the video can use as much bandwidth as needed to maintain the value of quality, pass 0 for bandwidth. The default value is 16384.
                camera_quality:"0",//An integer that specifies the required level of picture quality, as determined by the amount of compression being applied to each video frame. Acceptable values range from 1 (lowest quality, maximum compression) to 100 (highest quality, no compression). To specify that picture quality can vary as needed to avoid exceeding bandwidth, pass 0 for quality.
                camera_fps:"30",
                camera_KeyFrameInterval:"30",//The number of video frames transmitted in full (called keyframes) instead of being interpolated by the video compression algorithm. The default value is 15, which means that every 15th frame is a keyframe. A value of 1 means that every frame is a keyframe. The allowed values are 1 through 300.
                camera_loopback:"0",
                mic_codec:"SoundCodec.SPEEX",
                mic_encodeQuality:"8",
                mic_framesPerPacket:"2",
                mic_gain:"60",//0 - 100, 50 is as is
                mic_noiseSuppressionLevel: "0", //0 to -30db
                mic_rate: "44", //44,22,11,8,5
                mic_silenceLevel: "0",
                mic_silenceTimeout: "5000",
                

                
                    };
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            var attributes = {};
            attributes.id = "H264Encoder_COMPLETED";
            attributes.name = "H264Encoder_COMPLETED";
            attributes.align = "middle";
            swfobject.embedSWF(
                "swf/H264_Encoder.swf", "flashContent", 
                "259", "195", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");

}

</script>
</head>

<body bgcolor="0xFFFFFF" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="100" onload="setupFlash()" onunload="killFlash()">
    <!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough 
             JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
             when JavaScript is disabled.
        -->
        <div id="flashContent">
            <p>
                To view this page ensure that Adobe Flash Player version 
                11.4.0 or greater is installed. 
            </p>
            <script type="text/javascript"> 
                var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://"); 
                document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
                                + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
            </script> 
        </div>
        
        <noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="259" height="195" id="H264Encoder_COMPLETED">
                <param name="movie" value="swf/H264_Encoder.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="swf/H264_Encoder.swf" width="259" height="195">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                    <p> 
                        Either scripts and active content are not permitted to run or Adobe Flash Player version
                        11.4.0 or greater is not installed.
                    </p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </noscript>
</body>
</html>
