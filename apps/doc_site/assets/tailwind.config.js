// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
const defaultTheme = require("tailwindcss/defaultTheme")
const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/doc_site_web.ex",
    "../lib/doc_site_web/**/*.*ex"
  ],
  theme: {
    extend: {
      borderRadius: {
        theme: "6px"
      },
      boxShadow : {
        small: "0 5px 10px rgba(0, 0, 0, 0.12)",
        medium: "0 8px 30px rgba(0, 0, 0, 0.12)",
        large: "0 30px 60px rgba(0, 0, 0, 0.12)",
        drop_down: "0 4px 4px 0 rgba(0, 0, 0, 0.02)"
      },
      transitionProperty: {
        'height': 'height'
      },
      spacing: {
        gap: "16pt",
        gap_half: "8pt",
      },
      colors: {
        background: "#FFF",
        border: "#EAEAEA",
        accent_1: "#FAFAFA",
        accent_2: "#EAEAEA",
        accent_3: "#999",
        accent_4: "#888",
        accent_5: "#666",
        accent_6: "#444",
        accent_7: "#333",
        aceent_8: "#111",
        foreground: "#000",
        success_lighter: "#D3E5FF",
        success_light: "#3291FF",
        success: "#0070F3",
        success_dark: "#0761D1",
        warning_lighter: "#FFEFCF",
        warning_light: "#F7B955",
        warning: "#F5A623",
        warning_dark: "#AB570A",
        error_lighter: "#F7D4D6",
        error_light: "#FF1A1A",
        error: "#E00",
        error_dark: "#C50000",
        cyan_lighter: "#AAFFEC",
        cyan_light: "#79FFE1",
        cyan: "#50E3C2",
        cyan_dark: "#29BC9B",
        violet_lighter: "#E3D7FC",
        violet_light: "#8A63D2",
        violet: "#7928CA",
        violet_dark: "#4C2889",
        highlight_alert: "#FF0080",
        highlight_purple: "#F81CE5",
        highlight_magenta: "#EB367F",
        brand: "#FD4F00",
      },
      fontFamily: {
        sans: ["Geist var", "Inter", defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({ addVariant }) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents({
        "hero": ({ name, fullPath }) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": theme("spacing.5"),
            "height": theme("spacing.5")
          }
        }
      }, { values })
    })
  ]
}
