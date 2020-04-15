Shader "Ciconia Studio/Shader Painter/MetalRough/Standard"
{
	Properties
	{
		[HideInInspector]_SpecularColor1("Specular Color1", Color) = (1,1,1,0)
		[HideInInspector]_MetallicGlossMap("Metallic(RoughA)1", 2D) = "white" {}
		[HideInInspector]_Metallic("Metallic1", Range( 0 , 2)) = 0.2
		[HideInInspector]_Glossiness("Roughness1", Range( 0 , 2)) = 0.5
		[HideInInspector]_SpecularColor2("Specular Color2", Color) = (1,1,1,0)
		[HideInInspector]_MetallicRoughA2("Metallic(RoughA)2", 2D) = "white" {}
		[HideInInspector]_Roughness2("Roughness2", Range( 0 , 2)) = 0.5
		[HideInInspector]_Metallic2("Metallic2", Range( 0 , 2)) = 0.2
		[HideInInspector]_TilingLayer1("TilingLayer1", Float) = 1
		[HideInInspector]_TilingLayer2("TilingLayer2", Float) = 1
		[HideInInspector]_Color("Color1", Color) = (1,1,1,0)
		[HideInInspector]_MainTex("Diffuse map1", 2D) = "white" {}
		[HideInInspector]_Desaturation1("Desaturation1", Float) = 0
		[HideInInspector]_Saturation1("Saturation1", Range( 0 , 0.45)) = 0
		[HideInInspector]_Brightness1("Brightness1", Range( -1 , 1)) = 0
		[HideInInspector]_CiconiaStudioBlend2("vivelespommes", Color) = (1,1,1,0)
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
		[HideInInspector]_AmbientOcclusionmap2("Ambient Occlusion map2", 2D) = "white" {}
		[HideInInspector]_AoIntensity2("Ao Intensity2", Range( 0 , 2)) = 0
		[HideInInspector]_EmissionColor("Emission Color1", Color) = (0,0,0,0)
		[HideInInspector]_EmissionMap("Emission map1", 2D) = "white" {}
		[HideInInspector]_EmissiveIntensity1("Emissive Intensity1", Range( 0 , 2)) = 1
		[HideInInspector]_EmissionColor2("Emission Color2", Color) = (0,0,0,0)
		[HideInInspector]_EmissionMap2("Emission map2", 2D) = "white" {}
		[HideInInspector]_EmissiveIntensity2("Emissive Intensity2", Range( 0 , 2)) = 1
		[HideInInspector]_FresnelStrength("Fresnel Strength", Range( 0 , 8)) = 0
		[HideInInspector]_Ambientlight("Ambient light", Range( 0 , 8)) = 0
		[HideInInspector]_Brushposition("Brush position", Vector) = (0,0,0,0)
		[HideInInspector]_Rotate("Rotate", Float) = 0
		[HideInInspector]_Brush("Brush", 2D) = "black" {}
		[HideInInspector]_OpacityDepth("Opacity Depth", Float) = 1
		[HideInInspector]_Opacity("Opacity", Float) = 1
		[HideInInspector]_Mask("Mask", 2D) = "black" {}
		[HideInInspector][Toggle]_Erase("Erase", Float) = 0
		[HideInInspector]_Pensize("Pen size", Float) = 0
		[HideInInspector]_Spread("Spread", Float) = 0
		[HideInInspector]_Contrast("Contrast", Float) = 3.5
		[HideInInspector][Toggle]_Heightmapcontstraintbymask("Heightmap contstraint by mask", Float) = 0
		[HideInInspector]_MaskOpacity("Mask Opacity", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
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
		uniform float _Heightmapcontstraintbymask;
		uniform float _Spread;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _Contrast;
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
		uniform float _MaskOpacity;
		uniform float4 _CiconiaStudioBlend2;
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
		uniform float _Ambientlight;
		uniform float4 _EmissionColor;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionMap_ST;
		uniform float _EmissiveIntensity1;
		uniform float4 _EmissionColor2;
		uniform sampler2D _EmissionMap2;
		uniform float4 _EmissionMap2_ST;
		uniform float _EmissiveIntensity2;
		uniform float _FresnelStrength;
		uniform float4 _SpecularColor1;
		uniform sampler2D _MetallicGlossMap;
		uniform float4 _MetallicGlossMap_ST;
		uniform float _Metallic;
		uniform float4 _SpecularColor2;
		uniform sampler2D _MetallicRoughA2;
		uniform float4 _MetallicRoughA2_ST;
		uniform float _Metallic2;
		uniform float _Glossiness;
		uniform float _Roughness2;
		uniform sampler2D _OcclusionMap;
		uniform float4 _OcclusionMap_ST;
		uniform float _AoIntensity1;
		uniform sampler2D _AmbientOcclusionmap2;
		uniform float4 _AmbientOcclusionmap2_ST;
		uniform float _AoIntensity2;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_BumpMap = i.uv_texcoord * _BumpMap_ST.xy + _BumpMap_ST.zw;
			float3 lerpResult5_g431 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _BumpMap, ( uv_BumpMap * _TilingLayer1 ) ) ) , _NormalIntensity1);
			float3 temp_output_479_0 = lerpResult5_g431;
			float2 uv_Normalmap2 = i.uv_texcoord * _Normalmap2_ST.xy + _Normalmap2_ST.zw;
			float3 lerpResult5_g430 = lerp( float3(0,0,1) , UnpackNormal( tex2D( _Normalmap2, ( uv_Normalmap2 * _TilingLayer2 ) ) ) , _NormalIntensity2);
			float3 temp_output_484_0 = lerpResult5_g430;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode7_g396 = tex2D( _MainTex, ( uv_MainTex * _TilingLayer1 ) );
			float ADiffuse1210 = tex2DNode7_g396.a;
			float clampResult11_g428 = clamp( ( _Spread + (( 1.0 + _Contrast ) + (ADiffuse1210 - 0.0) * (-_Contrast - ( 1.0 + _Contrast )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float2 uv_Brush = i.uv_texcoord * _Brush_ST.xy + _Brush_ST.zw;
			float2 appendResult19_g427 = (float2(_Brushposition.x , _Brushposition.y));
			float cos23_g427 = cos( _Rotate );
			float sin23_g427 = sin( _Rotate );
			float2 rotator23_g427 = mul( ( uv_Brush + ( appendResult19_g427 * _Pensize ) ) - float2( 0.5,0.5 ) , float2x2( cos23_g427 , -sin23_g427 , sin23_g427 , cos23_g427 )) + float2( 0.5,0.5 );
			float temp_output_25_0_g427 = ( tex2D( _Brush, rotator23_g427 ).a * _Opacity );
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float temp_output_33_0_g427 = ( tex2D( _Mask, uv_Mask ).r * _OpacityDepth );
			float temp_output_31_0_g427 = min( ( 1.0 - temp_output_25_0_g427 ) , temp_output_33_0_g427 );
			float ifLocalVar38_g427 = 0;
			if( lerp(0.0,1.0,_Erase) == 0.0 )
				ifLocalVar38_g427 = max( temp_output_25_0_g427 , temp_output_33_0_g427 );
			else
				ifLocalVar38_g427 = temp_output_31_0_g427;
			float MaskBrush232 = ifLocalVar38_g427;
			float temp_output_21_0_g428 = MaskBrush232;
			float blendOpSrc18_g428 = clampResult11_g428;
			float blendOpDest18_g428 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g428 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
			float blendOpSrc31_g428 = lerp(clampResult11_g428,( saturate( ( blendOpSrc18_g428 * blendOpDest18_g428 ) )),_Heightmapcontstraintbymask);
			float blendOpDest31_g428 = temp_output_21_0_g428;
			float Mask246 = ( ( saturate( ( blendOpSrc31_g428 + blendOpDest31_g428 ) )) * _MaskOpacity );
			float3 lerpResult347 = lerp( temp_output_479_0 , temp_output_484_0 , Mask246);
			float3 lerpResult420 = lerp( temp_output_479_0 , BlendNormals( temp_output_479_0 , temp_output_484_0 ) , Mask246);
			float3 Normalmap338 = lerp(lerpResult347,lerpResult420,_NormalBlend);
			o.Normal = Normalmap338;
			float4 temp_cast_0 = (( 1.0 - _Brightness1 )).xxxx;
			float4 temp_cast_1 = (_Saturation1).xxxx;
			float4 temp_cast_2 = (( 1.0 - _Saturation1 )).xxxx;
			float4 temp_cast_3 = (0.0).xxxx;
			float4 temp_cast_4 = (1.0).xxxx;
			float clampResult15_g396 = clamp( _Desaturation1 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g396 = (temp_cast_3 + (pow( tex2DNode7_g396 , temp_cast_0 ) - temp_cast_1) * (temp_cast_4 - temp_cast_3) / (temp_cast_2 - temp_cast_1)).rgb;
			float desaturateDot16_g396 = dot( desaturateInitialColor16_g396, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g396 = lerp( desaturateInitialColor16_g396, desaturateDot16_g396.xxx, clampResult15_g396 );
			float2 uv_Diffusemap2 = i.uv_texcoord * _Diffusemap2_ST.xy + _Diffusemap2_ST.zw;
			float4 tex2DNode7_g429 = tex2D( _Diffusemap2, ( uv_Diffusemap2 * _TilingLayer2 ) );
			float4 temp_cast_7 = (( 1.0 - _Brightness2 )).xxxx;
			float4 temp_cast_8 = (_Saturation2).xxxx;
			float4 temp_cast_9 = (( 1.0 - _Saturation2 )).xxxx;
			float4 temp_cast_10 = (0.0).xxxx;
			float4 temp_cast_11 = (1.0).xxxx;
			float clampResult15_g429 = clamp( _Desaturation2 , 0.0 , 1.0 );
			float3 desaturateInitialColor16_g429 = (temp_cast_10 + (pow( tex2DNode7_g429 , temp_cast_7 ) - temp_cast_8) * (temp_cast_11 - temp_cast_10) / (temp_cast_9 - temp_cast_8)).rgb;
			float desaturateDot16_g429 = dot( desaturateInitialColor16_g429, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar16_g429 = lerp( desaturateInitialColor16_g429, desaturateDot16_g429.xxx, clampResult15_g429 );
			float4 lerpResult251 = lerp( ( _Color * float4( desaturateVar16_g396 , 0.0 ) ) , ( _Color2 * float4( desaturateVar16_g429 , 0.0 ) ) , Mask246);
			float4 temp_output_467_0 = ( _CiconiaStudioBlend2 * lerpResult251 );
			float3 linearToGamma138 = LinearToGammaSpace( temp_output_467_0.rgb );
			float clampResult389 = clamp( _Ambientlight , 1.0 , 9.0 );
			float4 lerpResult139 = lerp( ( float4( linearToGamma138 , 0.0 ) * UNITY_LIGHTMODEL_AMBIENT ) , temp_output_467_0 , clampResult389);
			float4 Albedo211 = lerpResult139;
			o.Albedo = Albedo211.rgb;
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float2 uv_EmissionMap2 = i.uv_texcoord * _EmissionMap2_ST.xy + _EmissionMap2_ST.zw;
			float4 lerpResult378 = lerp( ( _EmissionColor * tex2D( _EmissionMap, ( uv_EmissionMap * _TilingLayer1 ) ) * _EmissiveIntensity1 ) , ( _EmissionColor2 * tex2D( _EmissionMap2, ( uv_EmissionMap2 * _TilingLayer2 ) ) * _EmissiveIntensity2 ) , Mask246);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float fresnelNdotV4_g448 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g448 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g448, 6.0 ) );
			float4 Emissivemap375 = ( lerpResult378 + ( ( ( 0.95 * fresnelNode4_g448 ) + 0.05 ) * _FresnelStrength ) );
			o.Emission = Emissivemap375.rgb;
			float2 uv_MetallicGlossMap = i.uv_texcoord * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
			float4 tex2DNode3_g444 = tex2D( _MetallicGlossMap, ( uv_MetallicGlossMap * _TilingLayer1 ) );
			float2 uv_MetallicRoughA2 = i.uv_texcoord * _MetallicRoughA2_ST.xy + _MetallicRoughA2_ST.zw;
			float4 tex2DNode3_g443 = tex2D( _MetallicRoughA2, ( uv_MetallicRoughA2 * _TilingLayer2 ) );
			float4 lerpResult266 = lerp( ( _SpecularColor1 * tex2DNode3_g444 * _Metallic ) , ( _SpecularColor2 * tex2DNode3_g443 * _Metallic2 ) , Mask246);
			float fresnelNdotV4_g445 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode4_g445 = ( -0.05 + 1.0 * pow( 1.0 - fresnelNdotV4_g445, 6.0 ) );
			float4 Metallic274 = ( lerpResult266 + ( ( ( 0.95 * fresnelNode4_g445 ) + 0.05 ) * _FresnelStrength ) );
			o.Metallic = Metallic274.r;
			float lerpResult336 = lerp( ( tex2DNode3_g444.a * _Glossiness ) , ( tex2DNode3_g443.a * _Roughness2 ) , Mask246);
			float Roughness275 = lerpResult336;
			o.Smoothness = Roughness275;
			float2 uv_OcclusionMap = i.uv_texcoord * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
			float blendOpSrc2_g447 = tex2D( _OcclusionMap, ( uv_OcclusionMap * _TilingLayer1 ) ).r;
			float blendOpDest2_g447 = ( 1.0 - _AoIntensity1 );
			float4 temp_cast_20 = (( saturate( ( 1.0 - ( 1.0 - blendOpSrc2_g447 ) * ( 1.0 - blendOpDest2_g447 ) ) ))).xxxx;
			float2 uv_AmbientOcclusionmap2 = i.uv_texcoord * _AmbientOcclusionmap2_ST.xy + _AmbientOcclusionmap2_ST.zw;
			float4 temp_cast_21 = (( 1.0 - _AoIntensity2 )).xxxx;
			float4 blendOpSrc2_g446 = tex2D( _AmbientOcclusionmap2, ( uv_AmbientOcclusionmap2 * _TilingLayer2 ) );
			float4 blendOpDest2_g446 = temp_cast_21;
			float4 lerpResult362 = lerp( temp_cast_20 , ( saturate( ( 1.0 - ( 1.0 - blendOpSrc2_g446 ) * ( 1.0 - blendOpDest2_g446 ) ) )) , Mask246);
			float4 Aomap351 = lerpResult362;
			o.Occlusion = Aomap351.r;
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