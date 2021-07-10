// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SciFI_HDRP/Sci-FiHDRP"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_Albedo("Albedo", 2D) = "white" {}
		_AlbedoColor("AlbedoColor", Color) = (1,1,1,0)
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Normal("Normal", 2D) = "white" {}
		_AO("AO", 2D) = "white" {}
		_Emission("Emission", 2D) = "black" {}
		[HDR][Gamma]_EmissionColor("EmissionColor", Color) = (0,0,0,0)
		[HDR][Gamma]_VertexColor("VertexColor", Color) = (22.36352,0,0,0)
		_ObjectHigh("ObjectHigh", Float) = 4
		_ObjectLow("ObjectLow", Float) = -0.5
		_Noises("Noises", 2D) = "white" {}
		_DissolveTiling("DissolveTiling", Float) = 18
		[HDR][Gamma]_DissolveColor("DissolveColor", Color) = (1.41976,33.89676,0,0)
		_DissolvePower("DissolvePower", Range( 0 , 1)) = 0
		_DissolveColorPower("DissolveColorPower", Float) = 0.02
		_DissolveSquareScale("DissolveSquareScale", Range( 0.01 , 1)) = 1
		_DissolveSquarePower("DissolveSquarePower", Range( 0 , 10)) = 1
		[HDR][Gamma]_FirstTextureColor("FirstTextureColor", Color) = (0,8.154376,91.32901,0)
		_FirstTextureHight("FirstTextureHight", Float) = 1.1
		_FirstTextureScale("FirstTextureScale", Range( 0.1 , 10)) = 1.69
		_FirstTextureTiling("FirstTextureTiling", Float) = 14
		[HDR][Gamma]_SecondTextureColor("SecondTextureColor", Color) = (0,2.038594,22.83225,0)
		_SecondTextureHight("SecondTextureHight", Float) = 1.79
		_SecondTextureScale("SecondTextureScale", Range( 0.1 , 10)) = 2.55
		_SecondTextureTiling("SecondTextureTiling", Float) = 24
		_DarkAreaScale("DarkAreaScale", Float) = 0.34
		_DarkAreaPower("DarkAreaPower", Float) = 3.24
		_OpacityScale("OpacityScale", Range( 0.01 , 0.9)) = 0.14
		_OpacityPower("OpacityPower", Range( 0 , 10)) = 1
		_NormalPower("NormalPower", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 5
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 32
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 128
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 128
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 64
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 64
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector] [ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector] [ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] _SurfaceType("Surface Type", Float) = 1
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector] [ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Int) = 0
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2
		[HideInInspector] [Enum(Front, 1, Back, 2)] _TransparentCullMode("Transparent Cull Mode", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4
		[HideInInspector] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Float) = 4
		[HideInInspector] [ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector] [ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector] [ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector] [ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector] [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Transparent" "Queue"="Transparent" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 ps4 xboxone vulkan metal switch
		#pragma multi_compile_instancing
		#pragma multi_compile _ LOD_FADE_CROSSFADE

		struct GlobalSurfaceDescription
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
		};

		struct AlphaSurfaceDescription
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription
		{
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription
		{
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription
		{
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};

		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif
			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_GBUFFER
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile _ LIGHT_LAYERS

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define ATTRIBUTES_NEED_TEXCOORD2
			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Normal;
			sampler2D _Noises;
			sampler2D _Emission;
			sampler2D _AO;


			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#endif
				surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
				surfaceData.metallic = surfaceDescription.Metallic;
				surfaceData.coatMask = surfaceDescription.CoatMask;

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask = surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness = surfaceDescription.IridescenceThickness;
				#endif
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor = surfaceDescription.Specular;
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif
				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS,doubleSidedConstants);

				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy = surfaceDescription.Anisotropy;
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord6 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz =	positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz =	normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord5.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float vpY19 = packedInput.ase_texcoord6.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult115 = clamp( pow( ( temp_output_30_0 * -1.0 * _DarkAreaScale ) , _DarkAreaPower ) , 0.0 , 1.0 );
				float4 lerpResult121 = lerp( float4( 0,0,0,0 ) , ( tex2DNode99 * _AlbedoColor ) , clampResult115);
				
				float2 uv_Normal = packedInput.ase_texcoord5.xy * _Normal_ST.xy + _Normal_ST.zw;
				
				float2 temp_cast_1 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord5.xy * temp_cast_1 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float smoothstepResult62 = smoothstep( ( temp_output_37_0 - 0.5 ) , ( temp_output_37_0 + 0.5 ) , vpY19);
				float4 lerpResult66 = lerp( float4( 0,0,0,0 ) , _VertexColor , smoothstepResult62);
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult78 = lerp( ( 1.0 - clampResult55 ) , 1.0 , clampResult72);
				float4 lerpResult80 = lerp( ( _DissolveColor * ( 1.0 - step( temp_output_33_0 , ( temp_output_27_0 + _DissolveColorPower ) ) ) ) , lerpResult66 , lerpResult78);
				float2 temp_cast_2 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord5.xy * temp_cast_2 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult83 = lerp( tex2DNode75.g , 0.0 , clampResult73);
				float4 lerpResult84 = lerp( lerpResult80 , _FirstTextureColor , lerpResult83);
				float2 temp_cast_3 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord5.xy * temp_cast_3 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult82 = lerp( tex2DNode77.b , 0.0 , clampResult74);
				float4 lerpResult90 = lerp( lerpResult84 , _SecondTextureColor , lerpResult82);
				float2 uv_Emission = packedInput.ase_texcoord5.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode89 = tex2D( _Emission, uv_Emission );
				float4 clampResult116 = clamp( ( tex2DNode89 / lerpResult90 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				float grayscale120 = Luminance(clampResult116.rgb);
				float4 lerpResult137 = lerp( lerpResult90 , ( tex2DNode89 * _EmissionColor ) , grayscale120);
				
				float2 uv_AO = packedInput.ase_texcoord5.xy * _AO_ST.xy + _AO_ST.zw;
				
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Albedo = lerpResult121.rgb;
				surfaceDescription.Normal = UnpackNormalmapRGorAG( tex2D( _Normal, uv_Normal ), _NormalPower );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = lerpResult137.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = tex2D( _AO, uv_AO ).r;
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _ALPHATEST_PREPASS_ON
				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				#endif

				#ifdef _ALPHATEST_POSTPASS_ON
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD0
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define ATTRIBUTES_NEED_TEXCOORD2
			#define ATTRIBUTES_NEED_COLOR

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION



			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Normal;
			sampler2D _Noises;
			sampler2D _Emission;
			sampler2D _AO;


			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#endif
				surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
				surfaceData.metallic = surfaceDescription.Metallic;
				surfaceData.coatMask = surfaceDescription.CoatMask;

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask = surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness = surfaceDescription.IridescenceThickness;
				#endif
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor = surfaceDescription.Specular;
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				GetNormalWS(fragInputs, normalTS, surfaceData.normalWS,doubleSidedConstants);
				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy = surfaceDescription.Anisotropy;
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) ); // Quantize V to _ScreenSize values
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData (posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			CBUFFER_START(UnityMetaPass)
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord.xy = inputMesh.uv0.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord1 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float2 uv;

				if (unity_MetaVertexControl.x)
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if (unity_MetaVertexControl.y)
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4(uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0);
				return outputPackedVaryingsMeshToPS;
			}

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float vpY19 = packedInput.ase_texcoord1.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult115 = clamp( pow( ( temp_output_30_0 * -1.0 * _DarkAreaScale ) , _DarkAreaPower ) , 0.0 , 1.0 );
				float4 lerpResult121 = lerp( float4( 0,0,0,0 ) , ( tex2DNode99 * _AlbedoColor ) , clampResult115);
				
				float2 uv_Normal = packedInput.ase_texcoord.xy * _Normal_ST.xy + _Normal_ST.zw;
				
				float2 temp_cast_1 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord.xy * temp_cast_1 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float smoothstepResult62 = smoothstep( ( temp_output_37_0 - 0.5 ) , ( temp_output_37_0 + 0.5 ) , vpY19);
				float4 lerpResult66 = lerp( float4( 0,0,0,0 ) , _VertexColor , smoothstepResult62);
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult78 = lerp( ( 1.0 - clampResult55 ) , 1.0 , clampResult72);
				float4 lerpResult80 = lerp( ( _DissolveColor * ( 1.0 - step( temp_output_33_0 , ( temp_output_27_0 + _DissolveColorPower ) ) ) ) , lerpResult66 , lerpResult78);
				float2 temp_cast_2 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord.xy * temp_cast_2 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult83 = lerp( tex2DNode75.g , 0.0 , clampResult73);
				float4 lerpResult84 = lerp( lerpResult80 , _FirstTextureColor , lerpResult83);
				float2 temp_cast_3 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord.xy * temp_cast_3 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult82 = lerp( tex2DNode77.b , 0.0 , clampResult74);
				float4 lerpResult90 = lerp( lerpResult84 , _SecondTextureColor , lerpResult82);
				float2 uv_Emission = packedInput.ase_texcoord.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode89 = tex2D( _Emission, uv_Emission );
				float4 clampResult116 = clamp( ( tex2DNode89 / lerpResult90 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				float grayscale120 = Luminance(clampResult116.rgb);
				float4 lerpResult137 = lerp( lerpResult90 , ( tex2DNode89 * _EmissionColor ) , grayscale120);
				
				float2 uv_AO = packedInput.ase_texcoord.xy * _AO_ST.xy + _AO_ST.zw;
				
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Albedo = lerpResult121.rgb;
				surfaceDescription.Normal = UnpackNormalmapRGorAG( tex2D( _Normal, uv_Normal ), _NormalPower );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = lerpResult137.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = tex2D( _AO, uv_AO ).r;
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4(0.0, 0.0, 0.0, 1.0);
				if (unity_MetaFragmentControl.x)
				{
					res.rgb = clamp(pow(abs(lightTransportData.diffuseColor), saturate(unity_OneOverOutputBoost)), 0, unity_MaxOutputValue);
				}

				if (unity_MetaFragmentControl.y)
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			Cull [_CullMode]

			ZClip [_ZClip]
			ZWrite On
			ZTest LEqual

			ColorMask 0

			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_SHADOWS
			#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Noises;


			
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );
				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData (posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord2 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS.xyz);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH) // When only WRITE_MSAA_DEPTH is define and not WRITE_NORMAL_BUFFER it mean we are Unlit and only need depth, but we still have normal buffer binded
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif

						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS  = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float2 temp_cast_0 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord1.xy * temp_cast_0 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float vpY19 = packedInput.ase_texcoord2.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float2 temp_cast_1 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord1.xy * temp_cast_1 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float2 temp_cast_2 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord1.xy * temp_cast_2 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmesh.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}

			ENDHLSL
		}

			
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			ColorMask 0

			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			int _ObjectId;
			int _PassValue;

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Noises;


			
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord1 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif

						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3(1.0, 1.0, 1.0); // Avoid the division by 0

				SurfaceData surfaceData;
				BuiltinData builtinData;
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float2 temp_cast_0 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord.xy * temp_cast_0 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float vpY19 = packedInput.ase_texcoord1.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float2 temp_cast_1 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord.xy * temp_cast_1 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float2 temp_cast_2 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord.xy * temp_cast_2 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmesh.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD0
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define ATTRIBUTES_NEED_TEXCOORD2
			#define ATTRIBUTES_NEED_TEXCOORD3
			#define ATTRIBUTES_NEED_COLOR
			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD0
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2
			#define VARYINGS_NEED_TEXCOORD3
			#define VARYINGS_NEED_COLOR

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 interp05 : TEXCOORD5;
				float4 interp06 : TEXCOORD6;
				float4 interp07 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Noises;


			
			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );
				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];

				#ifdef _HAS_REFRACTION
				surfaceData.transmittanceMask = 1.0 - surfaceDescription.Alpha;
				surfaceDescription.Alpha = 1.0;
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord8 = float4(inputMesh.positionOS,1);

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv0;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp05.xyzw = inputMesh.uv2;
				outputPackedVaryingsMeshToPS.interp06.xyzw = inputMesh.uv3;
				outputPackedVaryingsMeshToPS.interp07.xyzw = inputMesh.color;
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH) // When only WRITE_MSAA_DEPTH is define and not WRITE_NORMAL_BUFFER it mean we are Unlit and only need depth, but we still have normal buffer binded
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif

						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS  = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;
				float4 texCoord0 = packedInput.interp03.xyzw;
				float4 texCoord1 = packedInput.interp04.xyzw;
				float4 texCoord2 = packedInput.interp05.xyzw;
				float4 texCoord3 = packedInput.interp06.xyzw;
				float4 vertexColor = packedInput.interp07.xyzw;


				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord0 = texCoord0;
				input.texCoord1 = texCoord1;
				input.texCoord2 = texCoord2;
				input.texCoord3 = texCoord3;
				input.color = vertexColor;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 uv_Albedo = packedInput.interp03.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float2 temp_cast_0 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.interp03.xy * temp_cast_0 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float vpY19 = packedInput.ase_texcoord8.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float2 temp_cast_1 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.interp03.xy * temp_cast_1 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float2 temp_cast_2 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.interp03.xy * temp_cast_2 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#define VARYINGS_NEED_POSITION_WS

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct AttributesPass
			{
				float3 previousPositionOS : TEXCOORD4;
			};

			struct VaryingsPassToPS
			{
				float4 positionCS;
				float4 previousPositionCS;
			};

			#define VARYINGS_NEED_PASS
			struct VaryingsToPS
			{
				VaryingsMeshToPS vmesh;
				VaryingsPassToPS vpass;
			};

			struct PackedVaryingsToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1;
				float3 vpassInterpolators1 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Noises;


			
			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );
				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData( SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif
				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			VaryingsPassToPS UnpackVaryingsPassToPS(PackedVaryingsToPS input)
			{
				VaryingsPassToPS output;
				output.positionCS = float4(input.vpassInterpolators0.xy, 0.0, input.vpassInterpolators0.z);
				output.previousPositionCS = float4(input.vpassInterpolators1.xy, 0.0, input.vpassInterpolators1.z);

				return output;
			}
#if UNITY_VERSION < 201930
			float3 TransformPreviousObjectToWorldNormal(float3 normalOS)
			{
				#ifdef UNITY_ASSUME_UNIFORM_SCALING
				return normalize( mul( (float3x3)unity_MatrixPreviousM, normalOS ) );
				#else
				return normalize( mul( normalOS, (float3x3)unity_MatrixPreviousMI ) );
				#endif
			}

			float3 TransformPreviousObjectToWorld(float3 positionOS)
			{
				float4x4 previousModelMatrix = ApplyCameraTranslationToMatrix(unity_MatrixPreviousM);
				return mul(previousModelMatrix, float4(positionOS, 1.0)).xyz;
			}

#endif
			void VelocityPositionZBias(VaryingsToPS input)
			{
				#if defined(UNITY_REVERSED_Z)
				input.vmesh.positionCS.z -= unity_MotionVectorsParams.z * input.vmesh.positionCS.w;
				#else
				input.vmesh.positionCS.z += unity_MotionVectorsParams.z * input.vmesh.positionCS.w;
				#endif
			}

			PackedVaryingsToPS Vert(AttributesMesh inputMesh,
									AttributesPass inputPass
									 )
			{
				PackedVaryingsToPS outputPackedVaryingsToPS;
				VaryingsToPS varyingsType;
				VaryingsMeshToPS outputVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsToPS.ase_texcoord4 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);

				outputVaryingsMeshToPS.positionRWS = positionRWS;
				outputVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);

				varyingsType.vmesh = outputVaryingsMeshToPS;

				VelocityPositionZBias(varyingsType);
				varyingsType.vpass.positionCS = mul(_NonJitteredViewProjMatrix, float4(varyingsType.vmesh.positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					varyingsType.vpass.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0; // Skin or morph target
					float3 previousPositionRWS = TransformPreviousObjectToWorld(hasDeformation ? inputPass.previousPositionOS : inputMesh.positionOS);
					varyingsType.vpass.previousPositionCS = mul(_PrevViewProjMatrix, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsToPS.vmeshPositionCS = varyingsType.vmesh.positionCS;
				outputPackedVaryingsToPS.vmeshInterp00.xyz = varyingsType.vmesh.positionRWS;

				outputPackedVaryingsToPS.vpassInterpolators0 = float3(varyingsType.vpass.positionCS.xyw);
				outputPackedVaryingsToPS.vpassInterpolators1 = float3(varyingsType.vpass.previousPositionCS.xyw);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsToPS );
				return outputPackedVaryingsToPS;
			}

			void Frag(  PackedVaryingsToPS packedInput
						, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target1
							#ifdef WRITE_MSAA_DEPTH
								, out float1 depthColor : SV_Target2
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target1
						, out float1 depthColor : SV_Target2
						#endif

						#ifdef _DEPTHOFFSET_ON
							, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord3.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float2 temp_cast_0 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord3.xy * temp_cast_0 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float vpY19 = packedInput.ase_texcoord4.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float2 temp_cast_1 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord3.xy * temp_cast_1 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float2 temp_cast_2 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord3.xy * temp_cast_2 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				VaryingsPassToPS inputPass = UnpackVaryingsPassToPS( packedInput );
				#ifdef _DEPTHOFFSET_ON
				inputPass.positionCS.w += builtinData.depthOffset;
				inputPass.previousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( inputPass.positionCS, inputPass.previousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmeshPositionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmeshPositionCS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend] , [_AlphaSrcBlend] [_AlphaDstBlend]

			Cull [_CullModeForward]

			ZTest [_ZTestDepthEqualForOpaque]

			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_ColorMaskTransparentVel] 1

			HLSLPROGRAM

			#define _BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
			#define _ENABLE_FOG_ON_TRANSPARENT 1
			#define _AMBIENT_OCCLUSION 1
			#define ASE_SRP_VERSION 70108


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_DOTS_INSTANCING)
			#pragma instancing_options nolightprobe
			#pragma instancing_options nolodfade
			#else
			#pragma instancing_options renderinglayer
			#endif

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
			//#define USE_CLUSTERED_LIGHTLIST

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define ATTRIBUTES_NEED_TEXCOORD2
			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"

			#define HAS_LIGHTLOOP

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			int _ObjectId;
			int _PassValue;

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			CBUFFER_START( UnityPerMaterial )
			float _ObjectLow;
			float _ObjectHigh;
			float4 _Albedo_ST;
			float4 _AlbedoColor;
			float _DarkAreaScale;
			float _DarkAreaPower;
			float _NormalPower;
			float4 _Normal_ST;
			float _Metallic;
			float4 _DissolveColor;
			float _DissolveTiling;
			float _DissolvePower;
			float _DissolveColorPower;
			float4 _VertexColor;
			float _DissolveSquareScale;
			float _DissolveSquarePower;
			float4 _FirstTextureColor;
			float _FirstTextureTiling;
			float _FirstTextureHight;
			float _FirstTextureScale;
			float4 _SecondTextureColor;
			float _SecondTextureTiling;
			float _SecondTextureHight;
			float _SecondTextureScale;
			float4 _Emission_ST;
			float _Smoothness;
			float4 _AO_ST;
			float _OpacityScale;
			float _OpacityPower;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			float _ShaderSciFi;
			sampler2D _Albedo;
			sampler2D _Normal;
			sampler2D _Noises;
			sampler2D _Emission;
			sampler2D _AO;


			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#endif
				surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
				surfaceData.metallic = surfaceDescription.Metallic;
				surfaceData.coatMask = surfaceDescription.CoatMask;

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask = surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness = surfaceDescription.IridescenceThickness;
				#endif
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor = surfaceDescription.Specular;
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif

				float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
				normalTS = surfaceDescription.Normal;
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
				#endif
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				bentNormalWS = surfaceData.normalWS;
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[ 2 ];

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy = surfaceDescription.Anisotropy;
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
				surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				uint3 fadeMaskSeed = asuint( (int3)( V * _ScreenSize.xyx ) );
				LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData( posInput, surfaceDescription.Alpha );
					ApplyDecalToSurfaceData( decalSurfaceData, surfaceData );
				}
				#endif

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{

				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float vpY19 = inputMesh.positionOS.y;
				float temp_output_93_0 = ( temp_output_37_0 - vpY19 );
				float clampResult101 = clamp( temp_output_93_0 , 0.0 , temp_output_93_0 );
				float4 appendResult124 = (float4(0.0 , ( ( inputMesh.normalOS.y * 0.02 ) + clampResult101 ) , 0.0 , 0.0));
				float smoothstepResult113 = smoothstep( ( temp_output_37_0 - 0.2 ) , ( temp_output_37_0 + 0.2 ) , vpY19);
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord6 = float4(inputMesh.positionOS,1);
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( appendResult124 * smoothstepResult113 ).xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						out float4 outDiffuseLighting : SV_Target1,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;

				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 uv_Albedo = packedInput.ase_texcoord5.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode99 = tex2D( _Albedo, uv_Albedo );
				float vpY19 = packedInput.ase_texcoord6.xyz.y;
				float temp_output_18_0 = (_ObjectLow + (_ShaderSciFi - 0.0) * (_ObjectHigh - _ObjectLow) / (1.0 - 0.0));
				float temp_output_22_0 = ( -1.0 * temp_output_18_0 );
				float temp_output_30_0 = ( vpY19 + temp_output_22_0 + 0.4 );
				float clampResult115 = clamp( pow( ( temp_output_30_0 * -1.0 * _DarkAreaScale ) , _DarkAreaPower ) , 0.0 , 1.0 );
				float4 lerpResult121 = lerp( float4( 0,0,0,0 ) , ( tex2DNode99 * _AlbedoColor ) , clampResult115);
				
				float2 uv_Normal = packedInput.ase_texcoord5.xy * _Normal_ST.xy + _Normal_ST.zw;
				
				float2 temp_cast_1 = (_DissolveTiling).xx;
				float2 uv016 = packedInput.ase_texcoord5.xy * temp_cast_1 + float2( 0,0 );
				float2 panner20 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv016);
				float temp_output_33_0 = ( 1.0 - tex2D( _Noises, panner20 ).r );
				float temp_output_27_0 = (1.0 + (_DissolvePower - 0.0) * (-0.1 - 1.0) / (1.0 - 0.0));
				float temp_output_37_0 = ( -0.3 + temp_output_18_0 );
				float smoothstepResult62 = smoothstep( ( temp_output_37_0 - 0.5 ) , ( temp_output_37_0 + 0.5 ) , vpY19);
				float4 lerpResult66 = lerp( float4( 0,0,0,0 ) , _VertexColor , smoothstepResult62);
				float clampResult55 = clamp( step( temp_output_33_0 , ( temp_output_27_0 + 0.1 ) ) , 0.0 , 1.0 );
				float clampResult72 = clamp( pow( ( temp_output_30_0 * -1.0 * _DissolveSquareScale ) , _DissolveSquarePower ) , 0.0 , 1.0 );
				float lerpResult78 = lerp( ( 1.0 - clampResult55 ) , 1.0 , clampResult72);
				float4 lerpResult80 = lerp( ( _DissolveColor * ( 1.0 - step( temp_output_33_0 , ( temp_output_27_0 + _DissolveColorPower ) ) ) ) , lerpResult66 , lerpResult78);
				float2 temp_cast_2 = (_FirstTextureTiling).xx;
				float2 uv058 = packedInput.ase_texcoord5.xy * temp_cast_2 + float2( 0,0 );
				float2 panner64 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv058);
				float4 tex2DNode75 = tex2D( _Noises, panner64 );
				float clampResult73 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _FirstTextureHight ) * -1.0 * _FirstTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult83 = lerp( tex2DNode75.g , 0.0 , clampResult73);
				float4 lerpResult84 = lerp( lerpResult80 , _FirstTextureColor , lerpResult83);
				float2 temp_cast_3 = (_SecondTextureTiling).xx;
				float2 uv060 = packedInput.ase_texcoord5.xy * temp_cast_3 + float2( 0,0 );
				float2 panner67 = ( 1.0 * _Time.y * float2( 0,-0.5 ) + uv060);
				float4 tex2DNode77 = tex2D( _Noises, panner67 );
				float clampResult74 = clamp( abs( ( ( vpY19 + temp_output_22_0 + _SecondTextureHight ) * -1.0 * _SecondTextureScale ) ) , 0.0 , 1.0 );
				float lerpResult82 = lerp( tex2DNode77.b , 0.0 , clampResult74);
				float4 lerpResult90 = lerp( lerpResult84 , _SecondTextureColor , lerpResult82);
				float2 uv_Emission = packedInput.ase_texcoord5.xy * _Emission_ST.xy + _Emission_ST.zw;
				float4 tex2DNode89 = tex2D( _Emission, uv_Emission );
				float4 clampResult116 = clamp( ( tex2DNode89 / lerpResult90 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				float grayscale120 = Luminance(clampResult116.rgb);
				float4 lerpResult137 = lerp( lerpResult90 , ( tex2DNode89 * _EmissionColor ) , grayscale120);
				
				float2 uv_AO = packedInput.ase_texcoord5.xy * _AO_ST.xy + _AO_ST.zw;
				
				float lerpResult119 = lerp( clampResult55 , 1.0 , clampResult72);
				float lerpResult112 = lerp( tex2DNode75.g , 1.0 , clampResult73);
				float lerpResult117 = lerp( tex2DNode77.b , 1.0 , clampResult74);
				float clampResult125 = clamp( pow( ( temp_output_30_0 * -1.0 * _OpacityScale ) , _OpacityPower ) , 0.0 , 1.0 );
				float lerpResult136 = lerp( ( lerpResult119 * lerpResult112 * lerpResult117 ) , 1.0 , clampResult125);
				
				surfaceDescription.Albedo = lerpResult121.rgb;
				surfaceDescription.Normal = UnpackNormalmapRGorAG( tex2D( _Normal, uv_Normal ), _NormalPower );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = _Metallic;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = lerpResult137.rgb;
				surfaceDescription.Smoothness = _Smoothness;
				surfaceDescription.Occlusion = tex2D( _AO, uv_AO ).r;
				surfaceDescription.Alpha = ( tex2DNode99.a * lerpResult136 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0.5;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(normalizedWorldViewDir, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);

				{
					#ifdef _SURFACE_TYPE_TRANSPARENT
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
					#else
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
					#endif
					float3 diffuseLighting;
					float3 specularLighting;

					LightLoop( normalizedWorldViewDir, posInput, preLightData, bsdfData, builtinData, featureFlags, diffuseLighting, specularLighting );

					diffuseLighting *= GetCurrentExposureMultiplier();
					specularLighting *= GetCurrentExposureMultiplier();

					#ifdef OUTPUT_SPLIT_LIGHTING
					if( _EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting( bsdfData ) )
					{
						outColor = float4( specularLighting, 1.0 );
						outDiffuseLighting = float4( TagLightingForSSS( diffuseLighting ), 1.0 );
					}
					else
					{
						outColor = float4( diffuseLighting + specularLighting, 1.0 );
						outDiffuseLighting = 0;
					}
					ENCODE_INTO_SSSBUFFER( surfaceData, posInput.positionSS, outSSSBuffer );
					#else
					outColor = ApplyBlendMode( diffuseLighting, specularLighting, builtinData.opacity );
					outColor = EvaluateAtmosphericScattering( posInput, normalizedWorldViewDir, outColor );
					#endif
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					/*VaryingsPassToPS inputPass = UnpackVaryingsPassToPS(packedInput.vpass);
					bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
					if (forceNoMotion)
					{
						outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
					}
					else
					{
						float2 motionVec = CalculateMotionVector(inputPass.positionCS, inputPass.previousPositionCS);
						EncodeMotionVector(motionVec * 0.5, outMotionVec);
						outMotionVec.zw = 1.0;
					}*/
					#endif
				}

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}
		
	}
	CustomEditor "UnityEditor.Rendering.HighDefinition.HDLitGUI"
	
	
}
/*ASEBEGIN
Version=17800
826;108;1036;807;1265.374;1251.843;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;11;-3756.617,1188.542;Float;False;Property;_ObjectHigh;ObjectHigh;9;0;Create;True;0;0;False;0;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-3804.888,-1425.95;Float;False;Property;_DissolveTiling;DissolveTiling;12;0;Create;True;0;0;False;0;18;18;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3879.472,1020.926;Float;False;Global;_ShaderSciFi;_ShaderSciFi;10;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-3755.421,1106.347;Float;False;Property;_ObjectLow;ObjectLow;10;0;Create;True;0;0;False;0;-0.5;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;17;-3600.152,1739.866;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-3545.552,-1443.149;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;-3375.027,-58.13031;Float;False;Constant;_Float0;Float 0;12;0;Create;True;0;0;False;0;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;18;-3521.385,1024.957;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-3183.214,-53.88739;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-3483.571,-1185.126;Float;False;Property;_DissolvePower;DissolvePower;14;0;Create;True;0;0;False;0;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;20;-3262.584,-1441.882;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,-0.5;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;19;-3314.437,1779.604;Float;False;vpY;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;27;-3137.542,-1179.919;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;-0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;24;-3043.311,-1470.889;Inherit;True;Property;_Noises;Noises;11;0;Create;True;0;0;False;0;-1;None;03dfea6fd064a664693a9d895fc4109a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-2958.656,-1065.335;Float;False;Constant;_OpacityPowerConst;OpacityPowerConst;10;0;Create;True;0;0;False;0;0.1;0.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;26;-2843.539,-624.7953;Inherit;False;19;vpY;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-2848.427,-483.4833;Float;False;Constant;_Const6;Const6;16;0;Create;True;0;0;False;0;0.4;0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;28;-2950.198,-473.3683;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-3191.709,1414.809;Float;False;Constant;_Const8;Const8;27;0;Create;True;0;0;False;0;-0.3;-0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;35;-2654.093,-1132.08;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-2653.454,-95.84631;Inherit;False;19;vpY;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-2698.458,-426.0233;Float;False;Property;_DissolveSquareScale;DissolveSquareScale;16;0;Create;True;0;0;False;0;1;1;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-2611.413,-594.7813;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;-2610.205,411.4416;Inherit;False;19;vpY;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;33;-2712.542,-1444.171;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-2976.046,-1270.862;Float;False;Property;_DissolveColorPower;DissolveColorPower;15;0;Create;True;0;0;False;0;0.02;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;36;-2815.371,395.6974;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-2671.726,42.42072;Float;False;Property;_FirstTextureHight;FirstTextureHight;19;0;Create;True;0;0;False;0;1.1;1.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-2653.23,572.9603;Float;False;Property;_SecondTextureHight;SecondTextureHight;23;0;Create;True;0;0;False;0;1.79;1.79;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-2614.445,1173.258;Float;False;Constant;_Float1;Float 1;5;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-2931.409,1421.358;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;45;-2290.557,1004.031;Inherit;False;19;vpY;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-2392.953,-426.3513;Float;False;Property;_DissolveSquarePower;DissolveSquarePower;17;0;Create;True;0;0;False;0;1;0.84;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-2459.456,-281.4573;Float;False;Property;_FirstTextureTiling;FirstTextureTiling;21;0;Create;True;0;0;False;0;14;14;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-2252.047,1239.377;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-2361.3,-64.90417;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-2595.997,222.1008;Float;False;Property;_SecondTextureTiling;SecondTextureTiling;25;0;Create;True;0;0;False;0;24;24;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-2381.12,614.2459;Float;False;Property;_SecondTextureScale;SecondTextureScale;24;0;Create;True;0;0;False;0;2.55;2.55;0.1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-2383.338,-595.5463;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;54;-2664.709,-1262.179;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-2390.615,86.70612;Float;False;Property;_FirstTextureScale;FirstTextureScale;20;0;Create;True;0;0;False;0;1.69;1.69;0.1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;48;-2351.804,462.6356;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;50;-2254.284,1104.871;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;51;-2441.167,-1154.067;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;61;-2360.5,-1290.669;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;57;-1926.114,1010.729;Float;False;Property;_VertexColor;VertexColor;8;2;[HDR];[Gamma];Create;True;0;0;False;0;22.36352,0,0,0;47.93726,4.015687,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;60;-2298.667,205.1405;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;63;-2148.806,-595.3643;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;58;-2199.757,-299.0733;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-2122.569,462.6067;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;-2092.439,-64.93323;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;55;-2224.758,-1152.662;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;62;-1908.991,1200.623;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;70;-1856.6,461.5962;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;68;-1969.301,-1151.844;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;64;-1929.493,-299.0163;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,-0.5;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;65;-2265.991,-1505.496;Float;False;Property;_DissolveColor;DissolveColor;13;2;[HDR];[Gamma];Create;True;0;0;False;0;1.41976,33.89676,0,0;14.55686,0,95.87451,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;72;-1927.427,-595.7023;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;67;-2018.408,206.9003;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,-0.5;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;66;-1593.784,1150.812;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;69;-2139.462,-1289.01;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;71;-1838.183,-64.9281;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;73;-1602.811,-63.8634;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;77;-1791.818,180.4299;Inherit;True;Property;_SecondTexture;SecondTexture;11;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;24;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1859.026,-1309.918;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;75;-1688.183,-327.8113;Inherit;True;Property;_FirstTexture;FirstTexture;11;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;24;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;74;-1609.84,461.2763;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;78;-1637.575,-1054.079;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;76;-1149.967,634.2155;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;83;-1283.93,-270.6503;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;81;-1054.063,-479.7064;Float;False;Property;_FirstTextureColor;FirstTextureColor;18;2;[HDR];[Gamma];Create;True;0;0;False;0;0,8.154376,91.32901,0;0,9.035295,95.87451,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;82;-1324.711,256.9906;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;80;-1035.398,-752.3513;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-2546.303,-853.4984;Float;False;Property;_DarkAreaScale;DarkAreaScale;26;0;Create;True;0;0;False;0;0.34;0.34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-2345.917,825.1319;Float;False;Property;_OpacityScale;OpacityScale;28;0;Create;True;0;0;False;0;0.14;0.14;0.01;0.9;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;88;-748.3021,-13.24734;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;84;-759.9665,-419.8373;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;-2528.16,1690.776;Inherit;False;19;vpY;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;85;-872.3322,-280.5883;Float;False;Property;_SecondTextureColor;SecondTextureColor;22;2;[HDR];[Gamma];Create;True;0;0;False;0;0,2.038594,22.83225,0;0,9.035295,95.87451,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;96;-2288.012,1564.552;Float;False;Constant;_Const2;Const2;5;0;Create;True;0;0;False;0;0.02;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;89;-719.0093,-680.1544;Inherit;True;Property;_Emission;Emission;6;0;Create;True;0;0;False;0;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-1978.831,677.7602;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;90;-552.8355,-298.9993;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-2028.688,837.9442;Float;False;Property;_OpacityPower;OpacityPower;29;0;Create;True;0;0;False;0;1;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;94;-2309.257,1409.178;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;92;-2703.654,1932.815;Float;False;Constant;_Const1;Const1;5;0;Create;True;0;0;False;0;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-2288.438,-744.2043;Float;False;Property;_DarkAreaPower;DarkAreaPower;27;0;Create;True;0;0;False;0;3.24;3.24;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;93;-2266.811,1666.432;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-2258.212,-894.5034;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;105;-2051.902,1500.424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;114;-1744.299,677.9422;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;99;-1573.349,-1518.202;Inherit;True;Property;_Albedo;Albedo;0;0;Create;True;0;0;False;0;-1;None;1949090ce94aa134286cc7987ebc66ea;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;119;-1642.938,-778.7873;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;102;-2409.777,1915.508;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;117;-1326.967,412.2268;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;98;-384.4623,-445.7313;Inherit;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;107;-2061.643,-894.3223;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;112;-1277.942,-111.2783;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;101;-2055.176,1666.91;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;108;-2428.522,1805.136;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;100;-1532.411,-1328.148;Float;False;Property;_AlbedoColor;AlbedoColor;1;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;106;-2249.251,1846.612;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;113;-2184.499,1868.758;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;109;-1192.109,-1282.988;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;110;-553.0985,-865.1653;Inherit;False;Property;_EmissionColor;EmissionColor;7;2;[HDR];[Gamma];Create;True;0;0;False;0;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;111;-997.8392,-1083.103;Inherit;False;Property;_NormalPower;NormalPower;30;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-843.5635,113.1412;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;116;-227.2716,-401.7842;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;115;-1853.448,-894.9783;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;125;-1522.919,677.6042;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;118;-1865.336,1560.915;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;120;-70.73792,-314.9333;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;122;-236.9691,-563.3543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;126;-782.092,-1088.404;Inherit;True;Property;_Normal;Normal;4;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;136;-449.3878,212.7872;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;124;-1682.574,1539.262;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;121;-984.3029,-1231.834;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;123;-1662.062,1832.39;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;107.4804,119.0878;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;139;-8.148445,-751.4727;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;128;-3315.644,1688.984;Float;False;vpX;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;134;-480.8749,-15.42352;Inherit;True;Property;_AO;AO;5;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;131;-467.5479,-93.53027;Inherit;False;Property;_Smoothness;Smoothness;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-3315.667,1869.437;Float;False;vpZ;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;137;139.0421,-236.9724;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-472.5064,-177.2663;Inherit;False;Property;_Metallic;Metallic;2;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1434.406,1538.589;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;138;-73.05883,-938.2808;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-23;False;True;True;0;True;-7;255;False;-1;255;True;-8;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-23;True;False;False;False;False;0;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;0;True;-18;0;True;-19;1;0;True;-20;0;True;-21;False;False;True;0;True;-25;False;True;True;0;True;-3;255;False;-1;255;True;-4;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;0;True;-22;True;0;True;-27;False;True;1;LightMode=Forward;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;9;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;True;0;True;-23;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;1;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;True;0;True;-23;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-23;False;True;True;0;True;-5;255;False;-1;255;True;-6;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;True;True;0;True;-9;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;0;True;-18;0;True;-19;1;0;True;-20;0;True;-21;False;False;True;1;False;-1;False;False;True;0;True;-22;True;0;True;-28;False;True;1;LightMode=TransparentBackface;False;0;;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;522.5262,-130.6316;Float;False;True;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;2;SciFI_HDRP/Sci-FiHDRP;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;5;0;False;False;False;True;0;True;-23;False;True;True;0;True;-12;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-13;False;True;1;LightMode=GBuffer;False;0;;0;0;Standard;29;Surface Type;1;  Rendering Pass;1;  Refraction Model;0;    Blending Mode;0;    Blend Preserves Specular;1;  Receive Fog;1;  Back Then Front Rendering;0;  Transparent Depth Prepass;0;  Transparent Depth Postpass;0;  Transparent Writes Motion Vector;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;1;  Z Test;4;Double-Sided;0;Alpha Clipping;0;  Use Shadow Threshold;0;Material Type,InvertActionOnDeselection;0;  Energy Conserving Specular;1;  Transmission;1;Receive Decals;1;Receives SSR;1;Specular AA;0;Specular Occlusion Mode;0;Override Baked GI;0;Depth Offset;0;DOTS Instancing;0;Vertex Position;1;0;11;True;True;True;True;True;True;False;False;False;False;True;False;;0
WireConnection;16;0;12;0
WireConnection;18;0;13;0
WireConnection;18;3;14;0
WireConnection;18;4;11;0
WireConnection;22;0;15;0
WireConnection;22;1;18;0
WireConnection;20;0;16;0
WireConnection;19;0;17;2
WireConnection;27;0;21;0
WireConnection;24;1;20;0
WireConnection;28;0;22;0
WireConnection;35;0;27;0
WireConnection;35;1;23;0
WireConnection;30;0;26;0
WireConnection;30;1;28;0
WireConnection;30;2;25;0
WireConnection;33;0;24;1
WireConnection;36;0;22;0
WireConnection;37;0;29;0
WireConnection;37;1;18;0
WireConnection;42;0;37;0
WireConnection;42;1;40;0
WireConnection;44;0;34;0
WireConnection;44;1;22;0
WireConnection;44;2;32;0
WireConnection;49;0;30;0
WireConnection;49;2;31;0
WireConnection;54;0;27;0
WireConnection;54;1;38;0
WireConnection;48;0;41;0
WireConnection;48;1;36;0
WireConnection;48;2;39;0
WireConnection;50;0;37;0
WireConnection;50;1;40;0
WireConnection;51;0;33;0
WireConnection;51;1;35;0
WireConnection;61;0;33;0
WireConnection;61;1;54;0
WireConnection;60;0;52;0
WireConnection;63;0;49;0
WireConnection;63;1;47;0
WireConnection;58;0;53;0
WireConnection;56;0;48;0
WireConnection;56;2;46;0
WireConnection;59;0;44;0
WireConnection;59;2;43;0
WireConnection;55;0;51;0
WireConnection;62;0;45;0
WireConnection;62;1;50;0
WireConnection;62;2;42;0
WireConnection;70;0;56;0
WireConnection;68;0;55;0
WireConnection;64;0;58;0
WireConnection;72;0;63;0
WireConnection;67;0;60;0
WireConnection;66;1;57;0
WireConnection;66;2;62;0
WireConnection;69;0;61;0
WireConnection;71;0;59;0
WireConnection;73;0;71;0
WireConnection;77;1;67;0
WireConnection;79;0;65;0
WireConnection;79;1;69;0
WireConnection;75;1;64;0
WireConnection;74;0;70;0
WireConnection;78;0;68;0
WireConnection;78;2;72;0
WireConnection;76;0;66;0
WireConnection;83;0;75;2
WireConnection;83;2;73;0
WireConnection;82;0;77;3
WireConnection;82;2;74;0
WireConnection;80;0;79;0
WireConnection;80;1;76;0
WireConnection;80;2;78;0
WireConnection;88;0;82;0
WireConnection;84;0;80;0
WireConnection;84;1;81;0
WireConnection;84;2;83;0
WireConnection;104;0;30;0
WireConnection;104;2;95;0
WireConnection;90;0;84;0
WireConnection;90;1;85;0
WireConnection;90;2;88;0
WireConnection;93;0;37;0
WireConnection;93;1;86;0
WireConnection;97;0;30;0
WireConnection;97;2;87;0
WireConnection;105;0;94;2
WireConnection;105;1;96;0
WireConnection;114;0;104;0
WireConnection;114;1;103;0
WireConnection;119;0;55;0
WireConnection;119;2;72;0
WireConnection;102;0;37;0
WireConnection;102;1;92;0
WireConnection;117;0;77;3
WireConnection;117;2;74;0
WireConnection;98;0;89;0
WireConnection;98;1;90;0
WireConnection;107;0;97;0
WireConnection;107;1;91;0
WireConnection;112;0;75;2
WireConnection;112;2;73;0
WireConnection;101;0;93;0
WireConnection;101;2;93;0
WireConnection;108;0;37;0
WireConnection;108;1;92;0
WireConnection;106;0;86;0
WireConnection;113;0;106;0
WireConnection;113;1;108;0
WireConnection;113;2;102;0
WireConnection;109;0;99;0
WireConnection;109;1;100;0
WireConnection;127;0;119;0
WireConnection;127;1;112;0
WireConnection;127;2;117;0
WireConnection;116;0;98;0
WireConnection;115;0;107;0
WireConnection;125;0;114;0
WireConnection;118;0;105;0
WireConnection;118;1;101;0
WireConnection;120;0;116;0
WireConnection;122;0;89;0
WireConnection;122;1;110;0
WireConnection;126;5;111;0
WireConnection;136;0;127;0
WireConnection;136;2;125;0
WireConnection;124;1;118;0
WireConnection;121;1;109;0
WireConnection;121;2;115;0
WireConnection;123;0;113;0
WireConnection;140;0;99;4
WireConnection;140;1;136;0
WireConnection;139;0;126;0
WireConnection;128;0;17;1
WireConnection;133;0;17;3
WireConnection;137;0;90;0
WireConnection;137;1;122;0
WireConnection;137;2;120;0
WireConnection;132;0;124;0
WireConnection;132;1;123;0
WireConnection;138;0;121;0
WireConnection;0;0;138;0
WireConnection;0;1;139;0
WireConnection;0;4;135;0
WireConnection;0;6;137;0
WireConnection;0;7;131;0
WireConnection;0;8;134;0
WireConnection;0;9;140;0
WireConnection;0;11;132;0
ASEEND*/
//CHKSM=A48B27AAAD114A125F8B88DD462F3B87510B6E5E