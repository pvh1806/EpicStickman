Shader "EGA/Particles/Blend_DistortTexture" {
	Properties {
		_MainTex ("MainTex", 2D) = "white" {}
		_Noise ("Noise", 2D) = "white" {}
		_Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_Emission ("Emission", Float) = 2
		_SpeedMainTexUVNoiseZW ("Speed MainTex U/V + Noise Z/W", Vector) = (0,0,0,0)
		[MaterialToggle] _Usedepth ("Use depth?", Float) = 0
		_Depthpower ("Depth power", Float) = 1
		_Flow ("Flow", 2D) = "white" {}
		_Mask ("Mask", 2D) = "white" {}
		_Distortionpower ("Distortion power", Float) = 0.2
		_Opacity ("Opacity", Range(0, 1)) = 1
		[HideInInspector] _texcoord ("", 2D) = "white" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		fixed4 _Color;
		struct Input
		{
			float2 uv_MainTex;
		};
		
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
}