-- setquality.lua

local logger = require("logger")
local var = require("variables")
local config = {}

function config.SetQuality(quality)
    logger.info("Setting", var.settings.mode, "quality to", quality)

    if quality == var.quality.VANILLA then
        SetOption("RayTracing/Reference", "RayNumber", "2")
        SetOption("RayTracing/Reference", "BounceNumber", "2")
        SetOption("RayTracing/Reference", "EnableProbabilisticSampling", false)
        SetOption("RayTracing/Reference", "RayNumberScreenshot", "3")
        SetOption("RayTracing/Reference", "BounceNumberScreenshot", "2")
        SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
        SetOption("Editor/SHARC", "DownscaleFactor", "5")
        SetOption("Editor/SHARC", "SceneScale", "50.0")
        SetOption("Editor/SHARC", "Bounces", "4")
        SetOption("Editor/ReGIR", "ShadingCandidatesCount", "4")
        SetOption("Editor/ReGIR", "BuildCandidatesCount", "8")
        SetOption("Rendering", "CheckerboardGI", true)
        return
    end

    if quality == var.quality.LOW then
        SetOption("Rendering", "CheckerboardGI", true)
        SetOption("Editor/Denoising/ReLAX/Direct/Common", "AtrousIterationNum", "4")
        SetOption("Editor/Denoising/ReLAX/Indirect/Common", "AtrousIterationNum", "4")
        SetOption("Editor/ReGIR", "LightSlotsCount", "256")
        SetOption("Editor/ReGIR", "ShadingCandidatesCount", "12")
        SetOption("Editor/ReGIR", "BuildCandidatesCount", "8")
        SetOption("Editor/SHARC", "Bounces", "1")
        SetOption("RayTracing/Reference", "RayNumberScreenshot", "3")
        SetOption("RayTracing/Reference", "BounceNumberScreenshot", "2")

        if var.settings.mode == var.mode.REGIR then
            SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)
            SetOption("Editor/ReSTIRGI", "Enable", false)
            SetOption("RayTracing/Reference", "RayNumber", "2")
            SetOption("RayTracing/Reference", "BounceNumber", "2")                      -- lower or higher is slower for some reason
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "DownscaleFactor", "7")
            SetOption("Editor/SHARC", "SceneScale", "30.0")
            return
        end

        SetOption("RayTracing/Reference", "RayNumber", "1")
        SetOption("RayTracing/Reference", "BounceNumber", "1")
        SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)

        if var.settings.mode == var.mode.PT20 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "DownscaleFactor", "6")
            SetOption("Editor/SHARC", "SceneScale", "33.3333333333")
            return
        end

        if var.settings.mode == var.mode.RT_PT then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "DownscaleFactor", "6")
            SetOption("Editor/SHARC", "SceneScale", "33.3333333333")
            return
        end

        if var.settings.mode == var.mode.PT21 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "DownscaleFactor", "6")
            SetOption("Editor/SHARC", "SceneScale", "33.3333333333")
            return
        end
    end

    if quality == var.quality.MEDIUM then
        SetOption("Rendering", "CheckerboardGI", true)
        SetOption("Editor/Denoising/ReLAX/Direct/Common", "AtrousIterationNum", "5")
        SetOption("Editor/Denoising/ReLAX/Indirect/Common", "AtrousIterationNum", "5")
        SetOption("Editor/ReGIR", "LightSlotsCount", "384")
        SetOption("Editor/ReGIR", "ShadingCandidatesCount", "16")
        SetOption("Editor/ReGIR", "BuildCandidatesCount", "8")
        SetOption("Editor/SHARC", "Bounces", "1")
        SetOption("RayTracing/Reference", "RayNumberScreenshot", "3")
        SetOption("RayTracing/Reference", "BounceNumberScreenshot", "2")

        if var.settings.mode == var.mode.REGIR then
            SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)
            SetOption("Editor/ReSTIRGI", "Enable", true)
            SetOption("RayTracing/Reference", "RayNumber", "2")
            SetOption("RayTracing/Reference", "BounceNumber", "2")                      -- lower or higher is slower for some reason
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "DownscaleFactor", "7")
            SetOption("Editor/SHARC", "SceneScale", "40.0")
            return
        end

        SetOption("RayTracing/Reference", "RayNumber", "1")
        SetOption("RayTracing/Reference", "BounceNumber", "2")
        SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)
        SetOption("Editor/SHARC", "DownscaleFactor", "5")

        if var.settings.mode == var.mode.PT20 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.RT_PT then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.PT21 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end
    end

    if quality == var.quality.HIGH then
        SetOption("Rendering", "CheckerboardGI", true)
        SetOption("Editor/Denoising/ReLAX/Direct/Common", "AtrousIterationNum", "6")
        SetOption("Editor/Denoising/ReLAX/Indirect/Common", "AtrousIterationNum", "6")
        SetOption("Editor/ReGIR", "LightSlotsCount", "512")
        SetOption("Editor/ReGIR", "ShadingCandidatesCount", "20")
        SetOption("Editor/ReGIR", "BuildCandidatesCount", "10")
        SetOption("Editor/SHARC", "Bounces", "2")
        SetOption("RayTracing/Reference", "RayNumberScreenshot", "3")
        SetOption("RayTracing/Reference", "BounceNumberScreenshot", "2")

        if var.settings.mode == var.mode.REGIR then
            SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)
            SetOption("Editor/ReSTIRGI", "Enable", true)
            SetOption("RayTracing/Reference", "RayNumber", "3")
            SetOption("RayTracing/Reference", "BounceNumber", "2")                      -- lower or higher is slower for some reason
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "DownscaleFactor", "6")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        SetOption("RayTracing/Reference", "RayNumber", "3")
        SetOption("RayTracing/Reference", "BounceNumber", "2")
        SetOption("RayTracing/Reference", "EnableProbabilisticSampling", false)
        SetOption("Editor/SHARC", "DownscaleFactor", "4")

        if var.settings.mode == var.mode.PT20 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.RT_PT then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.PT21 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end
    end

    if quality == var.quality.INSANE then
        SetOption("Rendering", "CheckerboardGI", true)
        SetOption("Editor/Denoising/ReLAX/Direct/Common", "AtrousIterationNum", "6")
        SetOption("Editor/Denoising/ReLAX/Indirect/Common", "AtrousIterationNum", "6")
        SetOption("Editor/ReGIR", "LightSlotsCount", "512")
        SetOption("Editor/ReGIR", "ShadingCandidatesCount", "24")
        SetOption("Editor/ReGIR", "BuildCandidatesCount", "12")
        SetOption("Editor/SHARC", "Bounces", "2")
        SetOption("RayTracing/Reference", "RayNumberScreenshot", "8")
        SetOption("RayTracing/Reference", "BounceNumberScreenshot", "3")

        if var.settings.mode == var.mode.REGIR then
            SetOption("RayTracing/Reference", "EnableProbabilisticSampling", true)
            SetOption("Editor/ReSTIRGI", "Enable", true)
            SetOption("RayTracing/Reference", "RayNumber", "3")
            SetOption("RayTracing/Reference", "BounceNumber", "2")                      -- lower or higher is slower for some reason
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "DownscaleFactor", "5")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        SetOption("RayTracing/Reference", "RayNumber", "5")
        SetOption("RayTracing/Reference", "BounceNumber", "2")
        SetOption("RayTracing/Reference", "EnableProbabilisticSampling", false)
        SetOption("Editor/SHARC", "DownscaleFactor", "4")

        if var.settings.mode == var.mode.PT20 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.RT_PT then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.16")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end

        if var.settings.mode == var.mode.PT21 then
            SetOption("Editor/SHARC", "UsePrevFrameBiasAllowance", "0.25")
            SetOption("Editor/SHARC", "SceneScale", "50.0")
            return
        end
    end
end

return config
