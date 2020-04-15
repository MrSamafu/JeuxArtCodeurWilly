Shader "Ciconia Studio/Shader Painter/MetalRough/2Sided/Wind VertexOffset (DirectX 11 Only)"
{
	Properties
	{
		[HideInInspector]_Color("Color1", Color) = (1,1,1,0)
		[HideInInspector]_MainTex("Diffuse map1", 2D) = "black" {}
		[HideInInspector]_Desaturation1("Desaturation1", Float) = 0
		[HideInInspector]_Saturation1("Saturation1", Range( 0 , 0.45)) = 0
		[HideInInspector]_Brightness1("Brightness1", Range( -1 , 1)) = 0
		[HideInInspector][Toggle]_VisualizeWind("Visualize Wind", Float) = 0
		[HideInInspector]_SpecularColor1("Specular Color1", Color) = (1,1,1,0)
		[HideInInspector]_MetallicGlossMap("Metallic(RoughA)1", 2D) = "white" {}
		[HideInInspector]_Metallic("Metallic1", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness("Roughness1", Range( 0 , 2)) = 0.5
		[HideInInspector]_Cutoff( "Mask Clip Value", Float ) = 0.5
		[HideInInspector][Toggle]_InvertTexture("Invert Texture", Float) = 0
		[HideInInspector]_WindTexture("Wind Texture", 2D) = "white" {}
		[HideInInspector][Toggle]_InvertWindFlow("Invert Wind Flow", Float) = 0
		[HideInInspector]_Deformation("Deformation", Float) = 0.4
		[HideInInspector]_Rotation("Rotation", Float) = 0
		[HideInInspector]_Speed("Speed", Float) = 0.01
		[HideInInspector]_Tessellation("Tessellation", Range( 0 , 1)) = 0
		[HideInInspector]_Smooth("Smooth", Range( 0 , 7)) = 0
		[HideInInspector][Toggle]_UseWorldCoordinate("Use World Coordinate", Float) = 0
		[HideInInspector]_2Sided("vivelespoires", Color) = (1,1,1,0)
		[HideInInspector]_CiconiaStudiowindvertexoffset("vivelespommes", Color) = (1,1,1,0)
		[HideInInspector][Toggle]_InvertAlbedoAlpha("Invert Albedo Alpha", Float) = 1
		[HideInInspector][Toggle]_DisableAlbedoAlphaChannel("Disable Albedo Alpha Channel", Float) = 0
		[HideInInspector]_MaskAmount("Mask Amount", Float) = 0
		[HideInInspector]_TilingLayer2("TilingLayer2", Float) = 1
		[HideInInspector]_TilingLayer1("TilingLayer1", Float) = 1
		[HideInInspector]_BumpMap("Normal map1", 2D) = "bump" {}
		[HideInInspector]_NormalIntensity1("Normal Intensity1", Range( 0 , 2)) = 1
		[HideInInspector]_OcclusionMap("Ambient Occlusion map1", 2D) = "white" {}
		[HideInInspector]_AoIntensity1("Ao Intensity1", Range( 0 , 2)) = 0
		[HideInInspector]_EmissionColor("Emission Color1", Color) = (0,0,0,0)
		[HideInInspector]_EmissionMap("Emission map1", 2D) = "white" {}
		[HideInInspector]_EmissiveIntensity1("Emissive Intensity1", Range( 0 , 2)) = 1
		[HideInInspector]_Ambientlight("Ambient light", Range( 0 , 8)) = 0
		[HideInInspector]_Brushposition("Brush position", Vector) = (0,0,0,0)
		[HideInInspector]_Rotate("Rotate", Float) = 0
		[HideInInspector]_Brush("Brush", 2D) = "black" {}
		[HideInInspector]_OpacityDepth("Opacity Depth", Float) = 1
		[HideInInspector]_Opacity("Opacity", Float) = 1
		[HideInInspector]_Mask("Mask", 2D) = "black" {}
		[HideInInspector][Toggle]_Erase("Erase", Float) = 0
		[HideInInspector]_Pensize("Pen size", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform float _InvertTexture;
		uniform sampler2D _WindTexture;
		uniform float _UseWorldCoordinate;
		uniform float4 _WindTexture_ST;
		uniform float _TilingLayer2;
		uniform float _Rotation;
		uniform float _InvertWindFlow;
		uniform float _Speed;
		uniform float _Smooth;
		uniform float _Erase;
		uniform sampler2D _Brush;
		uniform float4 _Brush_ST;
		uniform float4 _Brushposition;
		uniform float _Pensize;
		uniform float _Rotate;
		uniform float _Opacity;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _OpacityDepth;
		uniform float _Deformation;
		uniform sampler2D _BumpMap;
		uniform float4 _BumpMap_ST;
		uniform float _TilingLayer1;
		uniform float _NormalIntensity1;
		uniform float4 _CiconiaStudiowindvertexoffset;
		uniform float _VisualizeWind;
		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _Brightness1;
		uniform float _Saturation1;
		uniform float _Desaturation1;
		uniform float4 _2Sided;
		uniform float _Ambientlight;
		uniform float4 _EmissionColor;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionMap_ST;
		uniform float _EmissiveIntensity1;
		uniform float4 _SpecularColor1;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;
		uniform float _Metallic;
		uniform float _Glossiness;
		uniform sampler2D _OcclusionMap;
		uniform float4 _OcclusionMap_ST;
		uniform float _AoIntensity1;
		uniform float _DisableAlbedoAlphaChannel;
		uniform float _InvertAlbedoAlpha;
		uniform float _MaskAmount;
		uniform float _Tessellation;
		uniform float _Cutoff = 0.5;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float lerpResult14_g348 = lerp( 0.01 , 100.0 , _Tessellation);
			float Tessellation485 = lerpResult14_g348;
			float4 temp_cast_0 = (Tessellation485).xxxx;
			return temp_cast_0;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float2 uv_WindTexture = v.texcoord.xy * _WindTexture_ST.xy + _WindTexture_ST.zw;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float2 appendResult47_g348 = (float2(ase_worldPos.z , ase_worldPos.x));
			float cos20_g348 = cos( radians( _Rotation ) );
			float sin20_g348 = sin( radians( _Rotation ) );
			float2 rotator20_g348 = mul( ( lerp(uv_WindTexture,appendResult47_g348,_UseWorldCoordinate) * _TilingLayer2 ) - float2( 0.5,0.5 ) , float2x2( cos20_g348 , -sin20_g348 , sin20_g348 , cos20_g348 )) + float2( 0.5,0.5 );
			float temp_output_29_0_g348 = ( _Time.y * _Speed );
			float2 temp_output_33_0_g348 = ( uv_WindTexture / 4.0 );
			float2 panner26_g348 = ( temp_output_29_0_g348 * float2( 1,0 ) + temp_output_33_0_g348);
			float2 panner27_g348 = ( temp_output_29_0_g348 * float2( -1,0 ) + temp_output_33_0_g348);
			float4 tex2DNode35_g348 = tex2Dlod( _WindTexture, float4( ( rotator20_g348 + lerp(panner26_g348,panner27_g348,_InvertWindFlow) ), 0, _Smooth) );
			float2 uv_Brush = v.texcoord.xy * _Brush_ST.xy + _Brush_ST.zw;
			float2 appendResult19_g290 = (float2(_Brushposition.x , _Brushposition.y));
			float cos23_g290 = cos( _Rotate );
			float sin23_g290 = sin( _Rotate );
			float2 rotator23_g290 = mul( ( uv_Brush + ( appendResult19_g290 * _Pensize ) ) - float2( 0.5,0.5 ) , float2x2( cos23_g290 , -sin23_g290 , sin23_g290 , cos23_g290 )) + float2( 0.5,0.5 );
			float temp_output_25_0_g290 = ( tex2Dlod( _Brush, float4( rotator23_g290, 0, 0.0) ).a * _Opacity );
			float2 uv_Mask = v.texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float temp_output_33_0_g290 = ( tex2Dlod( _Mask, float4( uv_Mask, 0, 0.0) ).r * _OpacityDepth );
			float temp_output_31_0_g290 = min( ( 1.0 - temp_output_25_0_g290 ) , temp_output_33_0_g290 );
			float ifLocalVar38_g290 = 0;
			if( lerp(0.0,1.0,_Erase) == 0.0 )
				ifLocalVar38_g290 = max( temp_output_25_0_g290 , temp_output_33_0_g290 );
			else
				ifLocalVar38_g290 = temp_output_31_0_g290;
			float MaskBrush232 = ifLocalVar38_g290;
			float3 ase_vertexNormal = v.normal.xyz;
			float3 VertexOffset486 = ( lerp(tex2DNode35_g348.r,( 1.0 - tex2DNode35_g348.r ),_InvertTexture) * ( ( MaskBrush232 * ase_vertexNormal ) * _Deformation ) );
			v.vertex.xyz += VertexOffset486;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 lerpResult5_g376 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _BumpMap, ( uv_BumpMap * _TilingLayer1 ) ) ) , _NormalIntensity1);
			float3 Normalmap338 = lerpResult5_g376;
			o.Normal = Normalmap338;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode7_g349 = tex2D( _MainTex, ( uv_MainTex * _TilingLayer1 ) );
			float4 temp_cast_0 = (( 1.0 - _Brightness1 )).xxxx;
			float4 temp_cast_1 = (_Saturation1).xxxx;
			float4 temp_cast_2 = (( 1.0 - _Saturation1 )).xxxx;
			float4 temp_cast_3 = (0.0).xxxx;
			float4 temp_cast_4 = (1.0).xxxx;
			float clampResult15_g349 = clamp( _Desaturation1 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g349 = (temp_cast_3 + (pow( tex2DNode7_g349 , temp_cast_0 ) - temp_cast_1) * (temp_cast_4 - temp_cast_3) / (temp_cast_2 - temp_cast_1)).rgb;
			float desaturateDot16_g349 = dot( desaturateInitialColor16_g349, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g349 = lerp( desaturateInitialColor16_g349, desaturateDot16_g349.xxx, clampResult15_g349 );
			float2 uv_WindTexture = i.uv_texcoord * _WindTexture_ST.xy + _WindTexture_ST.zw;
			float3 ase_worldPos = i.worldPos;
			float2 appendResult47_g348 = (float2(ase_worldPos.z , ase_worldPos.x));
			float cos20_g348 = cos( radians( _Rotation ) );
			float sin20_g348 = sin( radians( _Rotation ) );
			float2 rotator20_g348 = mul( ( lerp(uv_WindTexture,appendResult47_g348,_UseWorldCoordinate) * _TilingLayer2 ) - float2( 0.5,0.5 ) , float2x2( cos20_g348 , -sin20_g348 , sin20_g348 , cos20_g348 )) + float2( 0.5,0.5 );
			float temp_output_29_0_g348 = ( _Time.y * _Speed );
			float2 temp_output_33_0_g348 = ( uv_WindTexture / 4.0 );
			float2 panner26_g348 = ( temp_output_29_0_g348 * float2( 1,0 ) + temp_output_33_0_g348);
			float2 panner27_g348 = ( temp_output_29_0_g348 * float2( -1,0 ) + temp_output_33_0_g348);
			float4 tex2DNode35_g348 = tex2Dlod( _WindTexture, float4( ( rotator20_g348 + lerp(panner26_g348,panner27_g348,_InvertWindFlow) ), 0, _Smooth) );
			float4 WindTexture481 = tex2DNode35_g348;
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float temp_output_33_0_g290 = ( tex2D( _Mask, uv_Mask ).r * _OpacityDepth );
			float MaskTex476 = temp_output_33_0_g290;
			float blendOpSrc28_g349 = ( 1.0 - WindTexture481.r );
			float blendOpDest28_g349 = ( 1.0 - MaskTex476 );
			float3 lerpResult27_g349 = lerp( float3(0,1,1) , desaturateVar16_g349 , ( saturate( ( 1.0 - ( 1.0 - blendOpSrc28_g349 ) * ( 1.0 - blendOpDest28_g349 ) ) )));
			float4 temp_output_505_0 = ( _CiconiaStudiowindvertexoffset * lerp(( _Color * float4( desaturateVar16_g349 , 0.0 ) ),float4( lerpResult27_g349 , 0.0 ),_VisualizeWind) * _2Sided );
			float3 linearToGamma138 = LinearToGammaSpace( temp_output_505_0.rgb );
			float clampResult389 = clamp( _Ambientlight , 1.0 , 9.0 );
			float4 lerpResult139 = lerp( ( float4( linearToGamma138 , 0.0 ) * UNITY_LIGHTMODEL_AMBIENT ) , temp_output_505_0 , clampResult389);
			float4 Albedo211 = lerpResult139;
			o.Albedo = Albedo211.rgb;
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float4 temp_output_445_0 = ( _EmissionColor * tex2D( _EmissionMap, ( uv_EmissionMap * _TilingLayer1 ) ) * _EmissiveIntensity1 );
			float4 Emissivemap375 = temp_output_445_0;
			o.Emission = Emissivemap375.rgb;
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode3_g373 = tex2D( _MetallicGlossMap, ( uv_MetallicGlossMap * _TilingLayer1 ) );
			float4 temp_output_504_0 = ( _SpecularColor1 * tex2DNode3_g373 * _Metallic );
			float4 Metallic274 = temp_output_504_0;
			o.Metallic = Metallic274.r;
			float Roughness275 = ( tex2DNode3_g373.a * _Glossiness );
			o.Smoothness = Roughness275;
			float2 uv_OcclusionMap = i.uv_texcoord * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
			float blendOpSrc2_g375 = tex2D( _OcclusionMap, ( uv_OcclusionMap * _TilingLayer1 ) ).r;
			float blendOpDest2_g375 = ( 1.0 - _AoIntensity1 );
			float Aomap351 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc2_g375 ) * ( 1.0 - blendOpDest2_g375 ) ) ));
			o.Occlusion = Aomap351;
			o.Alpha = 1;
			float ADiffuse1210 = tex2DNode7_g349.a;
			float Cutout460 = ( lerp(lerp(( 1.0 - ADiffuse1210 ),ADiffuse1210,_InvertAlbedoAlpha),1.0,_DisableAlbedoAlphaChannel) + _MaskAmount );
			clip( Cutout460 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
}