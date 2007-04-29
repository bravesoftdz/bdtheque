﻿using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.DirectX.Direct3D;

    class Utils
    {
        /// <summary>
        /// Gets the number of ColorChanelBits from a format
        /// </summary>
        static public int GetColorChannelBits(Format format)
        {
            switch (format)
            {
                case Format.R8G8B8:
                    return 8;
                case Format.A8R8G8B8:
                    return 8;
                case Format.X8R8G8B8:
                    return 8;
                case Format.R5G6B5:
                    return 5;
                case Format.X1R5G5B5:
                    return 5;
                case Format.A1R5G5B5:
                    return 5;
                case Format.A4R4G4B4:
                    return 4;
                case Format.R3G3B2:
                    return 2;
                case Format.A8R3G3B2:
                    return 2;
                case Format.X4R4G4B4:
                    return 4;
                case Format.A2B10G10R10:
                    return 10;
                case Format.A2R10G10B10:
                    return 10;
                default:
                    return 0;
            }
        }

        /// <summary>
        /// Gets the number of alpha channel bits 
        /// </summary>
        static public int GetAlphaChannelBits(Format format)
        {
            switch (format)
            {
                case Format.R8G8B8:
                    return 0;
                case Format.A8R8G8B8:
                    return 8;
                case Format.X8R8G8B8:
                    return 0;
                case Format.R5G6B5:
                    return 0;
                case Format.X1R5G5B5:
                    return 0;
                case Format.A1R5G5B5:
                    return 1;
                case Format.A4R4G4B4:
                    return 4;
                case Format.R3G3B2:
                    return 0;
                case Format.A8R3G3B2:
                    return 8;
                case Format.X4R4G4B4:
                    return 0;
                case Format.A2B10G10R10:
                    return 2;
                case Format.A2R10G10B10:
                    return 2;
                default:
                    return 0;
            }
        }

        /// <summary>
        /// Gets the number of depth bits
        /// </summary>
        static public int GetDepthBits(DepthFormat format)
        {
            switch (format)
            {
                case DepthFormat.D16:
                    return 16;
                case DepthFormat.D15S1:
                    return 15;
                case DepthFormat.D24X8:
                    return 24;
                case DepthFormat.D24S8:
                    return 24;
                case DepthFormat.D24X4S4:
                    return 24;
                case DepthFormat.D32:
                    return 32;
                default:
                    return 0;
            }
        }

        static public int GetStencilBits(DepthFormat format)
        {
            switch (format)
            {
                case DepthFormat.D16:
                    return 0;
                case DepthFormat.D15S1:
                    return 1;
                case DepthFormat.D24X8:
                    return 0;
                case DepthFormat.D24S8:
                    return 8;
                case DepthFormat.D24X4S4:
                    return 4;
                case DepthFormat.D32:
                    return 0;
                default:
                    return 0;
            }
        }
    }