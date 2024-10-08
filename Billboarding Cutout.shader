Shader "Particles/Billboarding Cutout"
{
    Properties
    {
        _TintColor ("Tint Color", Color) = (1,1,1,1.0)
        _MainTex ("Particle Texture", 2D) = "white" {}
        _Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
        _ScaleX ("Scale X", Range(0,500)) = 10.0
        _ScaleY ("Scale Y", Range(0,500)) = 10.0
        _Rotation ("Rotation", Range(0, 360)) = 180.0

    }
 
    SubShader
    {
        Tags { "Queue"="AlphaTest+51" "IgnoreProjector"="True" "RenderType"="AlphaTest" }
        LOD 200
 

        AlphaTest Greater [_Cutoff]
        ColorMask RGB
        Cull Back
 
        ZWrite On
        Fog { Mode Off }
        Lighting Off

        Pass
        {
 
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_particles

            #include "UnityCG.cginc"

            sampler2D _MainTex;
            fixed4 _TintColor;
            float _Cutoff;
            float _Rotation;
            float4 _MainTex_ST;
 
            struct appdata_t
            {
                float4 vertex : POSITION;
                fixed4 color : COLOR;
                float2 texcoord : TEXCOORD0;
            };
 
            struct v2f
            {
                float4 vertex : SV_POSITION;
                fixed4 color : COLOR;
                float2 texcoord : TEXCOORD0;
            };
 
            float _ScaleX;
            float _ScaleY;
 
            v2f vert(appdata_t v)
            {
                v2f o;

                float3 ori = UnityObjectToViewPos(float4(0,0,0,1)).xyz;
 
                float4 vt = v.vertex;
                vt.y = vt.z;
                vt.z = 0;
 
                vt.x *= _ScaleX;
                vt.y *= _ScaleY;
                vt.xyz += ori.xyz;
 
                o.vertex = mul(UNITY_MATRIX_P, vt);
 

                float2 uv = TRANSFORM_TEX(v.texcoord, _MainTex);
 

                uv = uv * 2.0 - 1.0;
                float angleRad = _Rotation * UNITY_PI / 180.0;
                float2x2 rotationMatrix = float2x2(cos(angleRad), -sin(angleRad), sin(angleRad), cos(angleRad));
                uv = mul(rotationMatrix, uv);
                o.texcoord = uv * 0.5 + 0.5;
 
                o.color = v.color;
                return o;
            }
 
            fixed4 frag(v2f i) : SV_Target
            {

                fixed4 texColor = tex2D(_MainTex, i.texcoord) * _TintColor;
                texColor.rgb *= i.color.rgb;
 

                clip(texColor.a - _Cutoff);
 
                return texColor;
            }
            ENDCG
        }
    }
 
    FallBack "Diffuse"
}