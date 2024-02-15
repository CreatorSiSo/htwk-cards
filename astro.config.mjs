import { defineConfig, squooshImageService } from "astro/config";

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
	srcDir: "website",
	publicDir: "website/public",
	integrations: [tailwind()],
	image: {
		service: squooshImageService(),
	},
});
