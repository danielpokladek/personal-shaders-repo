﻿Shader "DP/Spyro/Blocker"
{
    Properties 
    {
        _StencilMask("Stencil Mask", int) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry-1" }
        GrabPass{"_GrabTexture"}
        ColorMask 0

        Stencil
        {
            Ref[_StencilMask]
            Comp equal
            Pass keep
        }

        CGPROGRAM
        #pragma surface surf Lambert fullforwardshadows
        #pragma target 3.0

        struct Input
        {
            float2 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = float4(0, 1, 0, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
