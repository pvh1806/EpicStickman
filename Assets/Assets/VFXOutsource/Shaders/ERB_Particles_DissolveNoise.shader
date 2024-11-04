Shader "ERB/Particles/DissolveNoise" {
	Properties {
		_MainTex ("MainTex", 2D) = "white" {}
		_TextureNoise ("Texture Noise", 2D) = "white" {}
		_Dissolvenoise ("Dissolve noise", 2D) = "white" {}
		_NoisespeedXYEmissonZPowerW ("Noise speed XY / Emisson Z / Power W", Vector) = (0.5,0,2,1)
		_DissolvespeedXY ("Dissolve speed XY", Vector) = (0,0,0,0)
		_Maincolor ("Main color", Vector) = (0.7609469,0.8547776,0.9433962,1)
		_Noisecolor ("Noise color", Vector) = (0.2470588,0.3012382,0.3607843,1)
		_Dissolvecolor ("Dissolve color", Vector) = (1,1,1,1)
		[Toggle] _Usetexturecolor ("Use texture color", Float) = 0
		[MaterialToggle] _Usedepth ("Use depth?", Float) = 0
		_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
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
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
}