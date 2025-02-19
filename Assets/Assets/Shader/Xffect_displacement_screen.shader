Shader "Xffect/displacement/screen" {
	Properties {
		_DispMap ("Displacement Map (RG)", 2D) = "white" {}
		_MaskTex ("Mask (R)", 2D) = "white" {}
		_DispScrollSpeedX ("Map Scroll Speed X", Float) = 0
		_DispScrollSpeedY ("Map Scroll Speed Y", Float) = 0
		_StrengthX ("Displacement Strength X", Float) = 1
		_StrengthY ("Displacement Strength Y", Float) = -1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = 1;
		}
		ENDCG
	}
}