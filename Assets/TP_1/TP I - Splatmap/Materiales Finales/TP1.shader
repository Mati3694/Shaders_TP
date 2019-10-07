// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tp 1"
{
	Properties
	{
		_Splatmap("Splatmap", 2D) = "white" {}
		_Shirt("Shirt", 2D) = "white" {}
		_Shorts("_Shorts", 2D) = "white" {}
		_Socks("Socks", 2D) = "white" {}
		_ColorA("ColorA", Color) = (0,0,0,0)
		_ColorB("ColorB", Color) = (0,0,0,0)
		_ColorC("ColorC", Color) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Splatmap;
		uniform float4 _Splatmap_ST;
		uniform sampler2D _Shirt;
		uniform float4 _Shirt_ST;
		uniform sampler2D _Shorts;
		uniform float4 _Shorts_ST;
		uniform sampler2D _Socks;
		uniform float4 _Socks_ST;
		uniform float4 _ColorA;
		uniform float4 _ColorB;
		uniform float4 _ColorC;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Splatmap = i.uv_texcoord * _Splatmap_ST.xy + _Splatmap_ST.zw;
			float4 tex2DNode1 = tex2D( _Splatmap, uv_Splatmap );
			float2 uv_Shirt = i.uv_texcoord * _Shirt_ST.xy + _Shirt_ST.zw;
			float2 uv_Shorts = i.uv_texcoord * _Shorts_ST.xy + _Shorts_ST.zw;
			float2 uv_Socks = i.uv_texcoord * _Socks_ST.xy + _Socks_ST.zw;
			float4 break38 = ( ( tex2DNode1.r * tex2D( _Shirt, uv_Shirt ) ) + ( tex2DNode1.g * tex2D( _Shorts, uv_Shorts ) ) + ( tex2DNode1.b * tex2D( _Socks, uv_Socks ) ) );
			o.Albedo = ( ( break38.r * _ColorA ) + ( break38.g * _ColorB ) + ( break38.b * _ColorC ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
401;7;1281;1004;1787.731;214.5539;1.069106;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-1501.665,-398.7494;Float;True;Property;_Splatmap;Splatmap;0;0;Create;True;0;0;False;0;29f0c00477cd9004386b95c124015347;a8439084f1306d145b35d2fa7f79096d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;24;-1076.303,-279.0722;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;26;-1117.615,-252.0057;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;11;-1038.956,-324.7304;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;25;-1020.655,63.64423;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;23;-999.0408,-118.6981;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-1537.613,94.12496;Float;True;Property;_Shorts;_Shorts;2;0;Create;True;0;0;False;0;None;e11b7ee75e75bd4478dd9e03bdb8695a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1536.792,293.5495;Float;True;Property;_Socks;Socks;3;0;Create;True;0;0;False;0;None;8b3270105502c9a46831cfc30eba5fea;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-1544.613,-109.875;Float;True;Property;_Shirt;Shirt;1;0;Create;True;0;0;False;0;None;8b3270105502c9a46831cfc30eba5fea;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;27;-1044.626,257.3828;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-876.0051,62.84163;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-922.5598,-136.5914;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-887.3315,265.5869;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;32;-696.1038,30.30839;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;38;-542.4584,49.06834;Float;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;30;-579.7817,679.5983;Float;False;Property;_ColorC;ColorC;6;0;Create;True;0;0;False;0;0,0,0,0;0.05104129,0.1238609,0.2924528,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;28;-571.1593,303.6469;Float;False;Property;_ColorA;ColorA;4;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;29;-576.3326,477.8262;Float;False;Property;_ColorB;ColorB;5;0;Create;True;0;0;False;0;0,0,0,0;0.6870856,0.249644,0.9622642,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-207.7655,57.55983;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-203.3283,171.4858;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-193.4026,287.2856;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;41;34.88863,148.3257;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;237.5721,-7.038731;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Tp 1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;24;0;1;2
WireConnection;26;0;1;3
WireConnection;11;0;1;1
WireConnection;25;0;24;0
WireConnection;23;0;11;0
WireConnection;27;0;26;0
WireConnection;5;0;25;0
WireConnection;5;1;3;0
WireConnection;6;0;23;0
WireConnection;6;1;2;0
WireConnection;7;0;27;0
WireConnection;7;1;4;0
WireConnection;32;0;6;0
WireConnection;32;1;5;0
WireConnection;32;2;7;0
WireConnection;38;0;32;0
WireConnection;31;0;38;0
WireConnection;31;1;28;0
WireConnection;39;0;38;1
WireConnection;39;1;29;0
WireConnection;40;0;38;2
WireConnection;40;1;30;0
WireConnection;41;0;31;0
WireConnection;41;1;39;0
WireConnection;41;2;40;0
WireConnection;0;0;41;0
ASEEND*/
//CHKSM=A9808074A4A873905048BAE467B2AD4EDE824206