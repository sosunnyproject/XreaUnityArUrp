// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HologramDepthFadeURP"
{
	Properties
	{
		_Scale("Scale", Float) = 1
		_Power("Power", Float) = 1
		[HDR]_EmissionColor("EmissionColor", Color) = (0,0,0,0)
		_DepthPower("DepthPower", Float) = 0
		_Hologram1("Hologram", 2D) = "white" {}
		[Toggle(_INVERT1_ON)] _Invert1("Invert", Float) = 0
		_UV("UV", Float) = 1
		_VertexMovement("VertexMovement", Float) = 0.02

	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }
		
		Cull Back
		HLSLINCLUDE
		#pragma target 3.0
		ENDHLSL

		
		Pass
		{
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend SrcAlpha OneMinusSrcAlpha , One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#pragma shader_feature _INVERT1_ON


			sampler2D _Hologram1;
			uniform float4 _CameraDepthTexture_TexelSize;
			CBUFFER_START( UnityPerMaterial )
			float _VertexMovement;
			float _UV;
			float _Scale;
			float _Power;
			float4 _EmissionColor;
			float _DepthPower;
			CBUFFER_END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				float4 shadowCoord : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			VertexOutput vert ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2Dlod( _Hologram1, float4( panner17, 0, 0.0) ) * staticSwitch19 );
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( _VertexMovement * temp_output_22_0 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 lwWNormal = TransformObjectToWorldNormal(v.ase_normal);
				float3 lwWorldPos = TransformObjectToWorld(v.vertex.xyz);
				float3 lwWTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				float3 lwWBinormal = normalize(cross(lwWNormal, lwWTangent) * v.ase_tangent.w);
				o.tSpace0 = float4(lwWTangent.x, lwWBinormal.x, lwWNormal.x, lwWorldPos.x);
				o.tSpace1 = float4(lwWTangent.y, lwWBinormal.y, lwWNormal.y, lwWorldPos.y);
				o.tSpace2 = float4(lwWTangent.z, lwWBinormal.z, lwWNormal.z, lwWorldPos.z);

				VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);
				
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH(lwWNormal, o.lightmapUVOrVertexSH.xyz );

				half3 vertexLight = VertexLighting(vertexInput.positionWS, lwWNormal);
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				o.clipPos = vertexInput.positionCS;

				#ifdef _MAIN_LIGHT_SHADOWS
					o.shadowCoord = GetShadowCoord(vertexInput);
				#endif
				return o;
			}

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				float3 WorldSpaceNormal = normalize(float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z));
				float3 WorldSpaceTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldSpaceBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldSpacePosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldSpaceViewDirection = _WorldSpaceCameraPos.xyz  - WorldSpacePosition;
	
				#if SHADER_HINT_NICE_QUALITY
					WorldSpaceViewDirection = SafeNormalize( WorldSpaceViewDirection );
				#endif

				float2 appendResult14 = (float2(0.0 , 0.1));
				float2 appendResult8 = (float2(WorldSpacePosition.x , WorldSpacePosition.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float fresnelNdotV11 = dot( WorldSpaceNormal, WorldSpaceViewDirection );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2D( _Hologram1, panner17 ) * staticSwitch19 );
				float4 screenPos = IN.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth18 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth18 = abs( ( screenDepth18 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthPower ) );
				float clampResult21 = clamp( distanceDepth18 , 0.0 , 1.0 );
				float4 clampResult27 = clamp( ( temp_output_22_0 * clampResult21 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				
				float3 Albedo = _EmissionColor.rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = 0.5;
				float Occlusion = 1;
				float Alpha = clampResult27.r;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;

				InputData inputData;
				inputData.positionWS = WorldSpacePosition;

				#ifdef _NORMALMAP
					inputData.normalWS = normalize(TransformTangentToWorld(Normal, half3x3(WorldSpaceTangent, WorldSpaceBiTangent, WorldSpaceNormal)));
				#else
					#if !SHADER_HINT_NICE_QUALITY
						inputData.normalWS = WorldSpaceNormal;
					#else
						inputData.normalWS = normalize(WorldSpaceNormal);
					#endif
				#endif

				inputData.viewDirectionWS = WorldSpaceViewDirection;
				inputData.shadowCoord = IN.shadowCoord;

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.lightmapUVOrVertexSH.xyz, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif
				
				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex ShadowPassVertex
			#pragma fragment ShadowPassFragment


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature _INVERT1_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			sampler2D _Hologram1;
			uniform float4 _CameraDepthTexture_TexelSize;
			CBUFFER_START( UnityPerMaterial )
			float _VertexMovement;
			float _UV;
			float _Scale;
			float _Power;
			float4 _EmissionColor;
			float _DepthPower;
			CBUFFER_END


			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			
			float3 _LightDirection;

			VertexOutput ShadowPassVertex( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2Dlod( _Hologram1, float4( panner17, 0, 0.0) ) * staticSwitch19 );
				
				o.ase_texcoord7.xyz = ase_worldPos;
				o.ase_texcoord8.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord9 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( _VertexMovement * temp_output_22_0 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld(v.vertex.xyz);
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				o.clipPos = clipPos;

				return o;
			}

			half4 ShadowPassFragment(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = IN.ase_texcoord7.xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord8.xyz;
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2D( _Hologram1, panner17 ) * staticSwitch19 );
				float4 screenPos = IN.ase_texcoord9;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth18 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth18 = abs( ( screenDepth18 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthPower ) );
				float clampResult21 = clamp( distanceDepth18 , 0.0 , 1.0 );
				float4 clampResult27 = clamp( ( temp_output_22_0 * clampResult21 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				
				float Alpha = clampResult27.r;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature _INVERT1_ON


			sampler2D _Hologram1;
			uniform float4 _CameraDepthTexture_TexelSize;
			CBUFFER_START( UnityPerMaterial )
			float _VertexMovement;
			float _UV;
			float _Scale;
			float _Power;
			float4 _EmissionColor;
			float _DepthPower;
			CBUFFER_END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2Dlod( _Hologram1, float4( panner17, 0, 0.0) ) * staticSwitch19 );
				
				o.ase_texcoord.xyz = ase_worldPos;
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( _VertexMovement * temp_output_22_0 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				o.clipPos = TransformObjectToHClip(v.vertex.xyz);
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2D( _Hologram1, panner17 ) * staticSwitch19 );
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth18 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth18 = abs( ( screenDepth18 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthPower ) );
				float clampResult21 = clamp( distanceDepth18 , 0.0 , 1.0 );
				float4 clampResult27 = clamp( ( temp_output_22_0 * clampResult21 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				
				float Alpha = clampResult27.r;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature _INVERT1_ON


			sampler2D _Hologram1;
			uniform float4 _CameraDepthTexture_TexelSize;
			CBUFFER_START( UnityPerMaterial )
			float _VertexMovement;
			float _UV;
			float _Scale;
			float _Power;
			float4 _EmissionColor;
			float _DepthPower;
			CBUFFER_END


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2Dlod( _Hologram1, float4( panner17, 0, 0.0) ) * staticSwitch19 );
				
				o.ase_texcoord.xyz = ase_worldPos;
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( _VertexMovement * temp_output_22_0 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2D( _Hologram1, panner17 ) * staticSwitch19 );
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth18 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth18 = abs( ( screenDepth18 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthPower ) );
				float clampResult21 = clamp( distanceDepth18 , 0.0 , 1.0 );
				float4 clampResult27 = clamp( ( temp_output_22_0 * clampResult21 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				
				
				float3 Albedo = _EmissionColor.rgb;
				float3 Emission = 0;
				float Alpha = clampResult27.r;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend SrcAlpha OneMinusSrcAlpha , One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_SRP_VERSION 999999
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#pragma shader_feature _INVERT1_ON


			sampler2D _Hologram1;
			uniform float4 _CameraDepthTexture_TexelSize;
			CBUFFER_START( UnityPerMaterial )
			float _VertexMovement;
			float _UV;
			float _Scale;
			float _Power;
			float4 _EmissionColor;
			float _DepthPower;
			CBUFFER_END


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
			};

			
			VertexOutput vert( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;

				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = mul(GetObjectToWorldMatrix(), v.vertex).xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2Dlod( _Hologram1, float4( panner17, 0, 0.0) ) * staticSwitch19 );
				
				o.ase_texcoord.xyz = ase_worldPos;
				o.ase_texcoord1.xyz = ase_worldNormal;
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( _VertexMovement * temp_output_22_0 ).rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.vertex.xyz );
				o.clipPos = vertexInput.positionCS;
				return o;
			}

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				float2 appendResult14 = (float2(0.0 , 0.1));
				float3 ase_worldPos = IN.ase_texcoord.xyz;
				float2 appendResult8 = (float2(ase_worldPos.x , ase_worldPos.y));
				float2 panner17 = ( 1.0 * _Time.y * appendResult14 + ( appendResult8 * _UV ));
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = IN.ase_texcoord1.xyz;
				float fresnelNdotV11 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode11 = ( 0.0 + _Scale * pow( 1.0 - fresnelNdotV11, _Power ) );
				float clampResult16 = clamp( ( 1.0 - fresnelNode11 ) , 0.0 , 1.0 );
				#ifdef _INVERT1_ON
				float staticSwitch19 = clampResult16;
				#else
				float staticSwitch19 = fresnelNode11;
				#endif
				float4 temp_output_22_0 = ( tex2D( _Hologram1, panner17 ) * staticSwitch19 );
				float4 screenPos = IN.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth18 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float distanceDepth18 = abs( ( screenDepth18 - LinearEyeDepth( ase_screenPosNorm.z,_ZBufferParams ) ) / ( _DepthPower ) );
				float clampResult21 = clamp( distanceDepth18 , 0.0 , 1.0 );
				float4 clampResult27 = clamp( ( temp_output_22_0 * clampResult21 ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
				
				
				float3 Albedo = _EmissionColor.rgb;
				float Alpha = clampResult27.r;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}
		
	}
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=17700
88;44;1816;974;1303.008;425.7898;1;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;7;-2267.483,-180.9099;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;6;-2127.343,179.0743;Float;False;Property;_Scale;Scale;0;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-2126.343,258.074;Float;False;Property;_Power;Power;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2029.613,38.48743;Float;False;Constant;_Panner1;Panner;5;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-2021.621,-54.80305;Float;False;Property;_UV;UV;6;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;8;-2012.499,-157.5234;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;11;-1922.03,171.6149;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-1796.531,-159.4225;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;14;-1794.733,-39.60644;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;12;-1653.133,270.5894;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;16;-1462.509,271.393;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;17;-1600.364,-159.371;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1483.557,473.0266;Float;False;Property;_DepthPower;DepthPower;3;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;19;-1275.434,168.2894;Float;False;Property;_Invert1;Invert;5;0;Create;True;0;0;False;0;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;18;-1263.617,455.6049;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;20;-1363.207,-187.4854;Inherit;True;Property;_Hologram1;Hologram;4;0;Create;True;0;0;False;0;-1;None;6110bf08410df5d41984fa2fdf8db4e0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;21;-968.6301,454.6938;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-938.9904,33.32374;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-795.688,-53.07933;Float;False;Property;_VertexMovement;VertexMovement;7;0;Create;True;0;0;False;0;0.02;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-714.4564,224.0706;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;25;-711.1099,-474.3716;Float;False;Property;_EmissionColor;EmissionColor;2;1;[HDR];Create;True;0;0;False;0;0,0,0,0;4.243124,5.278032,0.7244357,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;-486.6033,8.173438;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;27;-500.6542,225.367;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;0,0;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;HologramDepthFadeURP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;0;Forward;12;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;2;0;True;1;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;12;Workflow;1;Surface;1;  Blend;0;Two Sided;1;Cast Shadows;1;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;Meta Pass;1;Override Baked GI;0;Vertex Position,InvertActionOnDeselection;1;0;5;True;True;True;True;True;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;3;Meta;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;4;Universal2D;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;True;1;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;True;True;True;True;True;0;False;-1;False;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;2;DepthOnly;0;False;False;False;True;0;False;-1;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;0;False;False;False;False;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
WireConnection;8;0;7;1
WireConnection;8;1;7;2
WireConnection;11;2;6;0
WireConnection;11;3;5;0
WireConnection;13;0;8;0
WireConnection;13;1;9;0
WireConnection;14;1;10;0
WireConnection;12;0;11;0
WireConnection;16;0;12;0
WireConnection;17;0;13;0
WireConnection;17;2;14;0
WireConnection;19;1;11;0
WireConnection;19;0;16;0
WireConnection;18;0;15;0
WireConnection;20;1;17;0
WireConnection;21;0;18;0
WireConnection;22;0;20;0
WireConnection;22;1;19;0
WireConnection;24;0;22;0
WireConnection;24;1;21;0
WireConnection;26;0;23;0
WireConnection;26;1;22;0
WireConnection;27;0;24;0
WireConnection;0;0;25;0
WireConnection;0;6;27;0
WireConnection;0;8;26;0
ASEEND*/
//CHKSM=4ECCA5A7FAECA0F5D5C1C1CA58266EFAC534E25F