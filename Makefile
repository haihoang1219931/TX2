old-dtb := $(dtb-y)
dtb-y :=
makefile-path := platform/t18x/quill/kernel-dts

dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-base.dtb
#dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-ape-cam.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-edp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-dsi-hdmi-dp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dsi-hdmi-dp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dsi-hdmi-dp-bl.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dsi-hdmi-hdmi.dtb
#dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dsi-hdmi-hdmi-imx274.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-dsi-dp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dp-primary.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-hdmi-primary-p3310-1000-c03-00.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-hdmi-primary-p3310-1000-a00-00.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-base-mods-display.dtb
#dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-a00-00-imx274.dtb
#dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-hdmi-primary-p3310-1000-a00-00-imx274.dtb
#dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-hdmi-primary-p3310-1000-c03-00-imx274.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-base.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c03-00-dsi-dp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3310-1000-c00-00-auo-1080p-edp.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-e3313-1000-a00-00-e2598.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3489-1000-a00-00-ucm1.dtb
dtb-$(CONFIG_ARCH_TEGRA_18x_SOC) += tegra186-quill-p3489-1000-a00-00-ucm2.dtb

ifneq ($(dtb-y),)
dtb-y := $(addprefix $(makefile-path)/,$(dtb-y))
dts-include += $(makefile-path)
endif

dtb-y += $(old-dtb)
