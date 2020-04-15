Shader "Ciconia Studio/Shader Painter/SpecGloss/2Sided/Standard Multi Layers"
{
	Properties
	{
		[HideInInspector]_Normalmap3("Normal map3", 2D) = "bump" {}
		[HideInInspector]_NormalIntensity3("Normal Intensity3", Range( 0 , 2)) = 1
		[HideInInspector]_SpecularColor3("Specular Color3", Color) = (1,1,1,0)
		[HideInInspector]_SpecularIntensity3("Specular Intensity3", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness3("Glossiness3", Range( 0 , 2)) = 0.5
		[HideInInspector]_SpecularColor2("Specular Color2", Color) = (1,1,1,0)
		[HideInInspector]_SpecularIntensity2("Specular Intensity2", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness2("Glossiness2", Range( 0 , 2)) = 0.5
		[HideInInspector]_2Sided("vivelespoires", Color) = (1,1,1,0)
		[HideInInspector]_CiconiaStudioStandardMultiLayer("vivelespommes", Color) = (1,1,1,0)
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
		[HideInInspector]_SpecGlossMap("Specular map(Gloss A)1", 2D) = "white" {}
		[HideInInspector]_SpecularColor1("Specular Color1", Color) = (1,1,1,0)
		[HideInInspector]_SpecularIntensity1("Specular Intensity1", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness1("Glossiness1", Range( 0 , 2)) = 0.5
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
		uniform sampler2D _SpecGlossMap;
		uniform float4 _SpecGlossMap_ST;
		uniform float _SpecularIntensity1;
		uniform float4 _SpecularColor2;
		uniform float _SpecularIntensity2;
		uniform float4 _SpecularColor3;
		uniform float _SpecularIntensity3;
		uniform float _Glossiness1;
		uniform float _Glossiness2;
		uniform float _Glossiness3;
		uniform sampler2D _OcclusionMap;
		uniform float4 _OcclusionMap_ST;
		uniform float _AoIntensity1;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float TilingLayer1478 = _TilingLayer1;
			float3 lerpResult5_g396 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _BumpMap, ( uv_BumpMap * TilingLayer1478 ) ) ) , _NormalIntensity1);
			float3 temp_output_443_0 = lerpResult5_g396;
			float2 uv_Normalmap2 = i.uv_texcoord * _Normalmap2_ST.xy + _Normalmap2_ST.zw;
			float TilingLayer2479 = _TilingLayer2;
			float3 lerpResult5_g397 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _Normalmap2, ( uv_Normalmap2 * TilingLayer2479 ) ) ) , _NormalIntensity2);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode7_g234 = tex2D( _MainTex, ( uv_MainTex * TilingLayer1478 ) );
			float ADiffuse1210 = tex2DNode7_g234.a;
			float temp_output_10_0_g373 = ADiffuse1210;
			float clampResult11_g373 = clamp( ( _Spread + (( 1.0 + _Contrast ) + (temp_output_10_0_g373 - 0.0) * (-_Contrast - ( 1.0 + _Contrast )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float HeightLayer258_g373 = clampResult11_g373;
			float temp_output_30_0_g373 = (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0));
			float2 uv_Brush = i.uv_texcoord * _Brush_ST.xy + _Brush_ST.zw;
			float2 appendResult19_g372 = (float2(_Brushposition.x , _Brushposition.y));
			float cos23_g372 = cos( _Rotate );
			float sin23_g372 = sin( _Rotate );
			float2 rotator23_g372 = mul( ( uv_Brush + ( appendResult19_g372 * _Pensize ) ) - float2( 0.5,0.5 ) , float2x2( cos23_g372 , -sin23_g372 , sin23_g372 , cos23_g372 )) + float2( 0.5,0.5 );
			float temp_output_25_0_g372 = ( tex2D( _Brush, rotator23_g372 ).a * _Opacity );
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float4 tex2DNode34_g372 = tex2D( _Mask, uv_Mask );
			float temp_output_33_0_g372 = ( tex2DNode34_g372.r * _MaskROpacityDepth );
			float temp_output_31_0_g372 = min( ( 1.0 - temp_output_25_0_g372 ) , temp_output_33_0_g372 );
			float ifLocalVar38_g372 = 0;
			if( lerp(0.0,0.0,_Erase) == 0.0 )
				ifLocalVar38_g372 = max( temp_output_25_0_g372 , temp_output_33_0_g372 );
			else
				ifLocalVar38_g372 = temp_output_31_0_g372;
			float ifLocalVar76_g372 = 0;
			if( _LayerSelector.x <= _LayerSelector.y )
				ifLocalVar76_g372 = temp_output_33_0_g372;
			else
				ifLocalVar76_g372 = ifLocalVar38_g372;
			float temp_output_21_0_g373 = ifLocalVar76_g372;
			float blendOpSrc18_g373 = HeightLayer258_g373;
			float blendOpDest18_g373 = saturate( ( temp_output_30_0_g373 + (( 1.0 + -6.0 ) + (temp_output_21_0_g373 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
			float MaskBrushR121_g373 = temp_output_21_0_g373;
			float blendOpSrc31_g373 = lerp(HeightLayer258_g373,( saturate( ( blendOpSrc18_g373 * blendOpDest18_g373 ) )),_HeightmapcontstraintbymaskLayer1);
			float blendOpDest31_g373 = MaskBrushR121_g373;
			float MaskR246 = ( ( saturate( ( blendOpSrc31_g373 + blendOpDest31_g373 ) )) * _MaskROpacity );
			float3 lerpResult347 = lerp( temp_output_443_0 , lerpResult5_g397 , MaskR246);
			float2 uv_Normalmap3 = i.uv_texcoord * _Normalmap3_ST.xy + _Normalmap3_ST.zw;
			float TilingLayer3480 = _TilingLayer3;
			float3 lerpResult5_g402 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _Normalmap3, ( uv_Normalmap3 * TilingLayer3480 ) ) ) , _NormalIntensity3);
			float ADiffuse1127_g373 = temp_output_10_0_g373;
			float temp_output_57_0_g373 = temp_output_33_0_g372;
			float temp_output_65_0_g373 = 0.0;
			float temp_output_64_0_g373 = ( temp_output_65_0_g373 * temp_output_57_0_g373 );
			float clampResult48_g373 = clamp( ( _Spread + (( 1.0 + _Contrast ) + (( ( ( ADiffuse1127_g373 * ( 1.0 - temp_output_57_0_g373 ) ) + temp_output_64_0_g373 ) + temp_output_64_0_g373 ) - 0.0) * (-_Contrast - ( 1.0 + _Contrast )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float HeightLayer359_g373 = clampResult48_g373;
			float MaskTexR115_g373 = temp_output_57_0_g373;
			float temp_output_55_0_g372 = ( tex2DNode34_g372.g * _MaskGOpacityDepth );
			float Erase59_g372 = lerp(0.0,0.0,_Erase);
			float Value060_g372 = 0.0;
			float temp_output_61_0_g372 = min( ( 1.0 - temp_output_25_0_g372 ) , temp_output_55_0_g372 );
			float ifLocalVar63_g372 = 0;
			if( Erase59_g372 == Value060_g372 )
				ifLocalVar63_g372 = max( temp_output_25_0_g372 , temp_output_55_0_g372 );
			else
				ifLocalVar63_g372 = temp_output_61_0_g372;
			float ifLocalVar78_g372 = 0;
			if( _LayerSelector.x == _LayerSelector.y )
				ifLocalVar78_g372 = ifLocalVar63_g372;
			else
				ifLocalVar78_g372 = temp_output_55_0_g372;
			float temp_output_84_0_g373 = ifLocalVar78_g372;
			float MaskBrushG122_g373 = temp_output_84_0_g373;
			float blendOpSrc100_g373 = lerp(( HeightLayer359_g373 * ( 1.0 - MaskTexR115_g373 ) ),( HeightLayer359_g373 * saturate( ( temp_output_30_0_g373 + (( 1.0 + -6.0 ) + (temp_output_84_0_g373 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) ) ),_HeightmapcontstraintbymaskLayer2);
			float blendOpDest100_g373 = MaskBrushG122_g373;
			float MaskG487 = ( ( saturate( ( blendOpSrc100_g373 + blendOpDest100_g373 ) )) * _MaskGOpacity );
			float3 lerpResult524 = lerp( lerpResult347 , lerpResult5_g402 , MaskG487);
			float3 Normalmap338 = lerp(lerpResult524,BlendNormals( temp_output_443_0 , lerpResult524 ),_NormalBlend);
			o.Normal = Normalmap338;
			float4 temp_cast_0 = (( 1.0 - _Brightness1 )).xxxx;
			float4 temp_cast_1 = (_Saturation1).xxxx;
			float4 temp_cast_2 = (( 1.0 - _Saturation1 )).xxxx;
			float4 temp_cast_3 = (0.0).xxxx;
			float4 temp_cast_4 = (1.0).xxxx;
			float clampResult15_g234 = clamp( _Desaturation1 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g234 = (temp_cast_3 + (pow( tex2DNode7_g234 , temp_cast_0 ) - temp_cast_1) * (temp_cast_4 - temp_cast_3) / (temp_cast_2 - temp_cast_1)).rgb;
			float desaturateDot16_g234 = dot( desaturateInitialColor16_g234, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g234 = lerp( desaturateInitialColor16_g234, desaturateDot16_g234.xxx, clampResult15_g234 );
			float2 uv_Diffusemap2 = i.uv_texcoord * _Diffusemap2_ST.xy + _Diffusemap2_ST.zw;
			float4 tex2DNode7_g374 = tex2D( _Diffusemap2, ( uv_Diffusemap2 * TilingLayer2479 ) );
			float4 temp_cast_7 = (( 1.0 - _Brightness2 )).xxxx;
			float4 temp_cast_8 = (_Saturation2).xxxx;
			float4 temp_cast_9 = (( 1.0 - _Saturation2 )).xxxx;
			float4 temp_cast_10 = (0.0).xxxx;
			float4 temp_cast_11 = (1.0).xxxx;
			float clampResult15_g374 = clamp( _Desaturation2 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g374 = (temp_cast_10 + (pow( tex2DNode7_g374 , temp_cast_7 ) - temp_cast_8) * (temp_cast_11 - temp_cast_10) / (temp_cast_9 - temp_cast_8)).rgb;
			float desaturateDot16_g374 = dot( desaturateInitialColor16_g374, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g374 = lerp( desaturateInitialColor16_g374, desaturateDot16_g374.xxx, clampResult15_g374 );
			float4 lerpResult251 = lerp( ( _Color * float4( desaturateVar16_g234 , 0.0 ) ) , ( _Color2 * float4( desaturateVar16_g374 , 0.0 ) ) , MaskR246);
			float2 uv_Diffusemap3 = i.uv_texcoord * _Diffusemap3_ST.xy + _Diffusemap3_ST.zw;
			float4 tex2DNode7_g379 = tex2D( _Diffusemap3, ( uv_Diffusemap3 * TilingLayer3480 ) );
			float4 temp_cast_14 = (( 1.0 - _Brightness3 )).xxxx;
			float4 temp_cast_15 = (_Saturation3).xxxx;
			float4 temp_cast_16 = (( 1.0 - _Saturation3 )).xxxx;
			float4 temp_cast_17 = (0.0).xxxx;
			float4 temp_cast_18 = (1.0).xxxx;
			float clampResult15_g379 = clamp( _Desaturation3 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g379 = (temp_cast_17 + (pow( tex2DNode7_g379 , temp_cast_14 ) - temp_cast_15) * (temp_cast_18 - temp_cast_17) / (temp_cast_16 - temp_cast_15)).rgb;
			float desaturateDot16_g379 = dot( desaturateInitialColor16_g379, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g379 = lerp( desaturateInitialColor16_g379, desaturateDot16_g379.xxx, clampResult15_g379 );
			float4 lerpResult476 = lerp( lerpResult251 , ( _Color3 * float4( desaturateVar16_g379 , 0.0 ) ) , MaskG487);
			float4 temp_output_548_0 = ( _CiconiaStudioStandardMultiLayer * lerpResult476 * _2Sided );
			float3 linearToGamma138 = LinearToGammaSpace( temp_output_548_0.rgb );
			float clampResult389 = clamp( _Ambientlight , 1.0 , 9.0 );
			float4 lerpResult139 = lerp( ( float4( linearToGamma138 , 0.0 ) * UNITY_LIGHTMODEL_AMBIENT ) , temp_output_548_0 , clampResult389);
			float4 Albedo211 = lerpResult139;
			o.Albedo = Albedo211.rgb;
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float fresnelNdotV4_g414 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g414 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g414, 6.0 ) );
			float4 Emissivemap375 = ( ( _EmissionColor * tex2D( _EmissionMap, ( uv_EmissionMap * TilingLayer1478 ) ) * _EmissiveIntensity1 ) + ( ( ( 0.95 * fresnelNode4_g414 ) + 0.05 ) * _FresnelStrength ) );
			o.Emission = Emissivemap375.rgb;
			float2 uv_SpecGlossMap = i.uv_texcoord * _SpecGlossMap_ST.xy + _SpecGlossMap_ST.zw;
			float4 tex2DNode3_g404 = tex2D( _SpecGlossMap, ( uv_SpecGlossMap * TilingLayer1478 ) );
			float4 lerpResult266 = lerp( ( _SpecularColor1 * tex2DNode3_g404 * _SpecularIntensity1 ) , ( _SpecularColor2 * _SpecularIntensity2 ) , MaskR246);
			float4 lerpResult499 = lerp( lerpResult266 , ( _SpecularColor3 * _SpecularIntensity3 ) , MaskG487);
			float fresnelNdotV4_g412 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g412 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g412, 6.0 ) );
			float4 Specularmap274 = ( lerpResult499 + ( ( ( 0.95 * fresnelNode4_g412 ) + 0.05 ) * _FresnelStrength ) );
			o.Specular = Specularmap274.rgb;
			float lerpResult336 = lerp( ( tex2DNode3_g404.a * _Glossiness1 ) , _Glossiness2 , MaskR246);
			float lerpResult506 = lerp( lerpResult336 , _Glossiness3 , MaskG487);
			float Glossiness275 = lerpResult506;
			o.Smoothness = Glossiness275;
			float2 uv_OcclusionMap = i.uv_texcoord * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
			float blendOpSrc2_g415 = tex2D( _OcclusionMap, ( uv_OcclusionMap * TilingLayer1478 ) ).r;
			float blendOpDest2_g415 = ( 1.0 - _AoIntensity1 );
			float Aomap351 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc2_g415 ) * ( 1.0 - blendOpDest2_g415 ) ) ));
			o.Occlusion = Aomap351;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardSpecular keepalpha fullforwardshadows 

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
				SurfaceOutputStandardSpecular o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandardSpecular, o )
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