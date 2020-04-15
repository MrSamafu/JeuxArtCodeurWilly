Shader "Ciconia Studio/Shader Painter/MetalRough/2Sided/Standard Multi Layers"
{
	Properties
	{
		[HideInInspector]_SpecularColor3("Specular Color3", Color) = (1,1,1,0)
		[HideInInspector]_Metallic3("Metallic3", Range( 0 , 2)) = 0.2
		[HideInInspector]_Roughness3("Roughness3", Range( 0 , 2)) = 0.5
		[HideInInspector]_SpecularColor1("Specular Color1", Color) = (1,1,1,0)
		[HideInInspector]_MetallicGlossMap("Metallic(RoughA)1", 2D) = "white" {}
		[HideInInspector]_Metallic("Metallic1", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness("Roughness1", Range( 0 , 2)) = 0.5
		[HideInInspector]_SpecularColor2("Specular Color2", Color) = (1,1,1,0)
		[HideInInspector]_Metallic2("Metallic2", Range( 0 , 2)) = 0.2
		[HideInInspector]_Roughness2("Roughness2", Range( 0 , 2)) = 0.5
		[HideInInspector]_2Sided("vivelespoires", Color) = (1,1,1,0)
		[HideInInspector]_CiconiaStudioStandardMultiLayer("vivelespommes", Color) = (1,1,1,0)
		[HideInInspector]_Normalmap3("Normal map3", 2D) = "bump" {}
		[HideInInspector]_NormalIntensity3("Normal Intensity3", Range( 0 , 2)) = 1
		[HideInInspector]_Spread("Spread", Float) = 0
		[HideInInspector]_Contrast("Contrast", Float) = 3.5
		[HideInInspector][Toggle]_HeightmapcontstraintbymaskLayer2("Heightmap contstraint by mask Layer2", Float) = 0
		[HideInInspector]_MaskROpacity("MaskR Opacity", Float) = 1
		[HideInInspector][Toggle]_HeightmapcontstraintbymaskLayer1("Heightmap contstraint by mask Layer1", Float) = 0
		[HideInInspector]_MaskGOpacity("MaskG Opacity", Float) = 1
		[HideInInspector]_Color3("Color3", Color) = (1,1,1,0)
		[HideInInspector]_Diffusemap3("Diffuse map3", 2D) = "white" {}
		[HideInInspector]_Desaturation3("Desaturation3", Float) = 0
		[HideInInspector]_Saturation3("Saturation3", Range( 0 , 0.45)) = 0
		[HideInInspector]_Brightness3("Brightness3", Range( -1 , 1)) = 0
		[HideInInspector]_Brushposition("Brush position", Vector) = (0,0,0,0)
		[HideInInspector]_Rotate("Rotate", Float) = 0
		[HideInInspector]_Brush("Brush", 2D) = "black" {}
		[HideInInspector]_MaskROpacityDepth("MaskR Opacity Depth", Float) = 1
		[HideInInspector]_MaskGOpacityDepth("MaskG Opacity Depth", Float) = 1
		[HideInInspector]_Opacity("Opacity", Float) = 1
		[HideInInspector]_Mask("Mask", 2D) = "black" {}
		[HideInInspector]_Pensize("Pen size", Float) = 0
		[HideInInspector]_LayerSelector("LayerSelector", Vector) = (0,0,0,0)
		[HideInInspector][Toggle]_Erase("Erase", Float) = 0
		[HideInInspector]_TilingLayer1("TilingLayer1", Float) = 1
		[HideInInspector]_TilingLayer3("TilingLayer3", Float) = 1
		[HideInInspector]_TilingLayer2("TilingLayer2", Float) = 1
		[HideInInspector]_Color("Color1", Color) = (1,1,1,0)
		[HideInInspector]_MainTex("Diffuse map1", 2D) = "white" {}
		[HideInInspector]_Desaturation1("Desaturation1", Float) = 0
		[HideInInspector]_Saturation1("Saturation1", Range( 0 , 0.45)) = 0
		[HideInInspector]_Brightness1("Brightness1", Range( -1 , 1)) = 0
		[HideInInspector]_Diffusemap2("Diffuse map2", 2D) = "white" {}
		[HideInInspector]_Color2("Color2", Color) = (1,1,1,0)
		[HideInInspector]_Desaturation2("Desaturation2", Float) = 0
		[HideInInspector]_Saturation2("Saturation2", Range( 0 , 0.45)) = 0
		[HideInInspector]_Brightness2("Brightness2", Range( -1 , 1)) = 0
		[HideInInspector]_BumpMap("Normal map1", 2D) = "bump" {}
		[HideInInspector]_NormalIntensity1("Normal Intensity1", Range( 0 , 2)) = 1
		[HideInInspector][Toggle]_NormalBlend("Normal Blend", Float) = 0
		[HideInInspector]_Normalmap2("Normal map2", 2D) = "bump" {}
		[HideInInspector]_NormalIntensity2("Normal Intensity2", Range( 0 , 2)) = 1
		[HideInInspector]_OcclusionMap("Ambient Occlusion map1", 2D) = "white" {}
		[HideInInspector]_AoIntensity1("Ao Intensity1", Range( 0 , 2)) = 0
		[HideInInspector]_EmissionColor("Emission Color1", Color) = (0,0,0,0)
		[HideInInspector]_EmissionMap("Emission map1", 2D) = "white" {}
		[HideInInspector]_EmissiveIntensity1("Emissive Intensity1", Range( 0 , 2)) = 1
		[HideInInspector]_FresnelStrength("Fresnel Strength", Range( 0 , 8)) = 0
		[HideInInspector]_Ambientlight("Ambient light", Range( 0 , 8)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.5
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform float _NormalBlend;
		uniform sampler2D _BumpMap;
		uniform float4 _BumpMap_ST;
		uniform float _TilingLayer1;
		uniform float _NormalIntensity1;
		uniform sampler2D _Normalmap2;
		uniform float4 _Normalmap2_ST;
		uniform float _TilingLayer2;
		uniform float _NormalIntensity2;
		uniform float _HeightmapcontstraintbymaskLayer1;
		uniform float _Spread;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _Contrast;
		uniform float2 _LayerSelector;
		uniform float _Erase;
		uniform sampler2D _Brush;
		uniform float4 _Brush_ST;
		uniform float4 _Brushposition;
		uniform float _Pensize;
		uniform float _Rotate;
		uniform float _Opacity;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _MaskROpacityDepth;
		uniform float _MaskROpacity;
		uniform sampler2D _Normalmap3;
		uniform float4 _Normalmap3_ST;
		uniform float _TilingLayer3;
		uniform float _NormalIntensity3;
		uniform float _HeightmapcontstraintbymaskLayer2;
		uniform float _MaskGOpacityDepth;
		uniform float _MaskGOpacity;
		uniform float4 _CiconiaStudioStandardMultiLayer;
		uniform float4 _Color;
		uniform float _Brightness1;
		uniform float _Saturation1;
		uniform float _Desaturation1;
		uniform float4 _Color2;
		uniform sampler2D _Diffusemap2;
		uniform float4 _Diffusemap2_ST;
		uniform float _Brightness2;
		uniform float _Saturation2;
		uniform float _Desaturation2;
		uniform float4 _Color3;
		uniform sampler2D _Diffusemap3;
		uniform float4 _Diffusemap3_ST;
		uniform float _Brightness3;
		uniform float _Saturation3;
		uniform float _Desaturation3;
		uniform float4 _2Sided;
		uniform float _Ambientlight;
		uniform float4 _EmissionColor;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionMap_ST;
		uniform float _EmissiveIntensity1;
		uniform float _FresnelStrength;
		uniform float4 _SpecularColor1;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;
		uniform float _Metallic;
		uniform float4 _SpecularColor2;
		uniform float _Metallic2;
		uniform float4 _SpecularColor3;
		uniform float _Metallic3;
		uniform float _Glossiness;
		uniform float _Roughness2;
		uniform float _Roughness3;
		uniform sampler2D _OcclusionMap;
		uniform float4 _OcclusionMap_ST;
		uniform float _AoIntensity1;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float TilingLayer1478 = _TilingLayer1;
			float3 lerpResult5_g442 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _BumpMap, ( uv_BumpMap * TilingLayer1478 ) ) ) , _NormalIntensity1);
			float3 temp_output_560_0 = lerpResult5_g442;
			float2 uv_Normalmap2 = i.uv_texcoord * _Normalmap2_ST.xy + _Normalmap2_ST.zw;
			float TilingLayer2479 = _TilingLayer2;
			float3 lerpResult5_g441 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _Normalmap2, ( uv_Normalmap2 * TilingLayer2479 ) ) ) , _NormalIntensity2);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode7_g433 = tex2D( _MainTex, ( uv_MainTex * TilingLayer1478 ) );
			float ADiffuse1210 = tex2DNode7_g433.a;
			float temp_output_10_0_g437 = ADiffuse1210;
			float clampResult11_g437 = clamp( ( _Spread + (( 1.0 + _Contrast ) + (temp_output_10_0_g437 - 0.0) * (-_Contrast - ( 1.0 + _Contrast )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float HeightLayer258_g437 = clampResult11_g437;
			float temp_output_30_0_g437 = (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
			float2 uv_Brush = i.uv_texcoord * _Brush_ST.xy + _Brush_ST.zw;
			float2 appendResult19_g436 = (float2(_Brushposition.x , _Brushposition.y));
			float cos23_g436 = cos( _Rotate );
			float sin23_g436 = sin( _Rotate );
			float2 rotator23_g436 = mul( ( uv_Brush + ( appendResult19_g436 * _Pensize ) ) - float2( 0.5,0.5 ) , float2x2( cos23_g436 , -sin23_g436 , sin23_g436 , cos23_g436 )) + float2( 0.5,0.5 );
			float temp_output_25_0_g436 = ( tex2D( _Brush, rotator23_g436 ).a * _Opacity );
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float4 tex2DNode34_g436 = tex2D( _Mask, uv_Mask );
			float temp_output_33_0_g436 = ( tex2DNode34_g436.r * _MaskROpacityDepth );
			float temp_output_31_0_g436 = min( ( 1.0 - temp_output_25_0_g436 ) , temp_output_33_0_g436 );
			float ifLocalVar38_g436 = 0;
			if( lerp(0.0,0.0,_Erase) == 0.0 )
				ifLocalVar38_g436 = max( temp_output_25_0_g436 , temp_output_33_0_g436 );
			else
				ifLocalVar38_g436 = temp_output_31_0_g436;
			float ifLocalVar76_g436 = 0;
			if( _LayerSelector.x <= _LayerSelector.y )
				ifLocalVar76_g436 = temp_output_33_0_g436;
			else
				ifLocalVar76_g436 = ifLocalVar38_g436;
			float temp_output_21_0_g437 = ifLocalVar76_g436;
			float blendOpSrc18_g437 = HeightLayer258_g437;
			float blendOpDest18_g437 = saturate( ( temp_output_30_0_g437 + (( 1.0 + -6.0 ) + (temp_output_21_0_g437 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
			float MaskBrushR121_g437 = temp_output_21_0_g437;
			float blendOpSrc31_g437 = lerp(HeightLayer258_g437,( saturate( ( blendOpSrc18_g437 * blendOpDest18_g437 ) )),_HeightmapcontstraintbymaskLayer1);
			float blendOpDest31_g437 = MaskBrushR121_g437;
			float MaskR246 = ( ( saturate( ( blendOpSrc31_g437 + blendOpDest31_g437 ) )) * _MaskROpacity );
			float3 lerpResult347 = lerp( temp_output_560_0 , lerpResult5_g441 , MaskR246);
			float2 uv_Normalmap3 = i.uv_texcoord * _Normalmap3_ST.xy + _Normalmap3_ST.zw;
			float TilingLayer3480 = _TilingLayer3;
			float3 lerpResult5_g446 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _Normalmap3, ( uv_Normalmap3 * TilingLayer3480 ) ) ) , _NormalIntensity3);
			float ADiffuse1127_g437 = temp_output_10_0_g437;
			float temp_output_57_0_g437 = temp_output_33_0_g436;
			float temp_output_65_0_g437 = 0.0;
			float temp_output_64_0_g437 = ( temp_output_65_0_g437 * temp_output_57_0_g437 );
			float clampResult48_g437 = clamp( ( _Spread + (( 1.0 + _Contrast ) + (( ( ( ADiffuse1127_g437 * ( 1.0 - temp_output_57_0_g437 ) ) + temp_output_64_0_g437 ) + temp_output_64_0_g437 ) - 0.0) * (-_Contrast - ( 1.0 + _Contrast )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float HeightLayer359_g437 = clampResult48_g437;
			float MaskTexR115_g437 = temp_output_57_0_g437;
			float temp_output_55_0_g436 = ( tex2DNode34_g436.g * _MaskGOpacityDepth );
			float Erase59_g436 = lerp(0.0,0.0,_Erase);
			float Value060_g436 = 0.0;
			float temp_output_61_0_g436 = min( ( 1.0 - temp_output_25_0_g436 ) , temp_output_55_0_g436 );
			float ifLocalVar63_g436 = 0;
			if( Erase59_g436 == Value060_g436 )
				ifLocalVar63_g436 = max( temp_output_25_0_g436 , temp_output_55_0_g436 );
			else
				ifLocalVar63_g436 = temp_output_61_0_g436;
			float ifLocalVar78_g436 = 0;
			if( _LayerSelector.x == _LayerSelector.y )
				ifLocalVar78_g436 = ifLocalVar63_g436;
			else
				ifLocalVar78_g436 = temp_output_55_0_g436;
			float temp_output_84_0_g437 = ifLocalVar78_g436;
			float MaskBrushG122_g437 = temp_output_84_0_g437;
			float blendOpSrc100_g437 = lerp(( HeightLayer359_g437 * ( 1.0 - MaskTexR115_g437 ) ),( HeightLayer359_g437 * saturate( ( temp_output_30_0_g437 + (( 1.0 + -6.0 ) + (temp_output_84_0_g437 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) ) ),_HeightmapcontstraintbymaskLayer2);
			float blendOpDest100_g437 = MaskBrushG122_g437;
			float MaskG487 = ( ( saturate( ( blendOpSrc100_g437 + blendOpDest100_g437 ) )) * _MaskGOpacity );
			float3 lerpResult524 = lerp( lerpResult347 , lerpResult5_g446 , MaskG487);
			float3 Normalmap338 = lerp(lerpResult524,BlendNormals( temp_output_560_0 , lerpResult524 ),_NormalBlend);
			o.Normal = Normalmap338;
			float4 temp_cast_0 = (( 1.0 - _Brightness1 )).xxxx;
			float4 temp_cast_1 = (_Saturation1).xxxx;
			float4 temp_cast_2 = (( 1.0 - _Saturation1 )).xxxx;
			float4 temp_cast_3 = (0.0).xxxx;
			float4 temp_cast_4 = (1.0).xxxx;
			float clampResult15_g433 = clamp( _Desaturation1 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g433 = (temp_cast_3 + (pow( tex2DNode7_g433 , temp_cast_0 ) - temp_cast_1) * (temp_cast_4 - temp_cast_3) / (temp_cast_2 - temp_cast_1)).rgb;
			float desaturateDot16_g433 = dot( desaturateInitialColor16_g433, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g433 = lerp( desaturateInitialColor16_g433, desaturateDot16_g433.xxx, clampResult15_g433 );
			float2 uv_Diffusemap2 = i.uv_texcoord * _Diffusemap2_ST.xy + _Diffusemap2_ST.zw;
			float4 tex2DNode7_g438 = tex2D( _Diffusemap2, ( uv_Diffusemap2 * TilingLayer2479 ) );
			float4 temp_cast_7 = (( 1.0 - _Brightness2 )).xxxx;
			float4 temp_cast_8 = (_Saturation2).xxxx;
			float4 temp_cast_9 = (( 1.0 - _Saturation2 )).xxxx;
			float4 temp_cast_10 = (0.0).xxxx;
			float4 temp_cast_11 = (1.0).xxxx;
			float clampResult15_g438 = clamp( _Desaturation2 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g438 = (temp_cast_10 + (pow( tex2DNode7_g438 , temp_cast_7 ) - temp_cast_8) * (temp_cast_11 - temp_cast_10) / (temp_cast_9 - temp_cast_8)).rgb;
			float desaturateDot16_g438 = dot( desaturateInitialColor16_g438, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g438 = lerp( desaturateInitialColor16_g438, desaturateDot16_g438.xxx, clampResult15_g438 );
			float4 lerpResult251 = lerp( ( _Color * float4( desaturateVar16_g433 , 0.0 ) ) , ( _Color2 * float4( desaturateVar16_g438 , 0.0 ) ) , MaskR246);
			float2 uv_Diffusemap3 = i.uv_texcoord * _Diffusemap3_ST.xy + _Diffusemap3_ST.zw;
			float4 tex2DNode7_g439 = tex2D( _Diffusemap3, ( uv_Diffusemap3 * TilingLayer3480 ) );
			float4 temp_cast_14 = (( 1.0 - _Brightness3 )).xxxx;
			float4 temp_cast_15 = (_Saturation3).xxxx;
			float4 temp_cast_16 = (( 1.0 - _Saturation3 )).xxxx;
			float4 temp_cast_17 = (0.0).xxxx;
			float4 temp_cast_18 = (1.0).xxxx;
			float clampResult15_g439 = clamp( _Desaturation3 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g439 = (temp_cast_17 + (pow( tex2DNode7_g439 , temp_cast_14 ) - temp_cast_15) * (temp_cast_18 - temp_cast_17) / (temp_cast_16 - temp_cast_15)).rgb;
			float desaturateDot16_g439 = dot( desaturateInitialColor16_g439, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g439 = lerp( desaturateInitialColor16_g439, desaturateDot16_g439.xxx, clampResult15_g439 );
			float4 lerpResult476 = lerp( lerpResult251 , ( _Color3 * float4( desaturateVar16_g439 , 0.0 ) ) , MaskG487);
			float4 temp_output_553_0 = ( _CiconiaStudioStandardMultiLayer * lerpResult476 * _2Sided );
			float3 linearToGamma138 = LinearToGammaSpace( temp_output_553_0.rgb );
			float clampResult389 = clamp( _Ambientlight , 1.0 , 9.0 );
			float4 lerpResult139 = lerp( ( float4( linearToGamma138 , 0.0 ) * UNITY_LIGHTMODEL_AMBIENT ) , temp_output_553_0 , clampResult389);
			float4 Albedo211 = lerpResult139;
			o.Albedo = Albedo211.rgb;
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float fresnelNdotV4_g448 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g448 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g448, 6.0 ) );
			float4 Emissivemap375 = ( ( _EmissionColor * tex2D( _EmissionMap, ( uv_EmissionMap * TilingLayer1478 ) ) * _EmissiveIntensity1 ) + ( ( ( 0.95 * fresnelNode4_g448 ) + 0.05 ) * _FresnelStrength ) );
			o.Emission = Emissivemap375.rgb;
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode3_g445 = tex2D( _MetallicGlossMap, ( uv_MetallicGlossMap * TilingLayer1478 ) );
			float4 lerpResult266 = lerp( ( _SpecularColor1 * tex2DNode3_g445 * _Metallic ) , ( _SpecularColor2 * _Metallic2 ) , MaskR246);
			float4 lerpResult499 = lerp( lerpResult266 , ( _SpecularColor3 * _Metallic3 ) , MaskG487);
			float fresnelNdotV4_g449 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g449 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g449, 6.0 ) );
			float4 Metallic274 = ( lerpResult499 + ( ( ( 0.95 * fresnelNode4_g449 ) + 0.05 ) * _FresnelStrength ) );
			o.Metallic = Metallic274.r;
			float lerpResult336 = lerp( ( tex2DNode3_g445.a * _Glossiness ) , _Roughness2 , MaskR246);
			float lerpResult506 = lerp( lerpResult336 , _Roughness3 , MaskG487);
			float Roughness275 = lerpResult506;
			o.Smoothness = Roughness275;
			float2 uv_OcclusionMap = i.uv_texcoord * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
			float blendOpSrc2_g451 = tex2D( _OcclusionMap, ( uv_OcclusionMap * TilingLayer1478 ) ).r;
			float blendOpDest2_g451 = ( 1.0 - _AoIntensity1 );
			float Aomap351 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc2_g451 ) * ( 1.0 - blendOpDest2_g451 ) ) ));
			o.Occlusion = Aomap351;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.5
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}