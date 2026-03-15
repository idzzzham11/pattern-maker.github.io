'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "63661998b35d09bfb871e16e8f010d29",
"assets/AssetManifest.bin.json": "3947357034f321709eded1c379c20152",
"assets/AssetManifest.json": "67f5e933c30c218d53d0cfed12f3c332",
"assets/assets/images/bodices/bodice_bust_semi_yoke_step_1.png": "a1a546434ddb2341bc506edc22d6f2c7",
"assets/assets/images/bodices/bodice_bust_semi_yoke_step_2.png": "d43d2d9e031e2a9a82f7a08ebfe4abdc",
"assets/assets/images/bodices/bodice_dart_cluster_step_1.png": "7978d6cb8331222c705d635639875be1",
"assets/assets/images/bodices/bodice_dart_cluster_step_2.png": "2b17e2cb37372233b8f1fe1decce6888",
"assets/assets/images/bodices/bodice_dart_cluster_step_3.png": "8ee29aeae654c2f4f222b9d97a9d4a85",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_1.png": "582c7f3e2f7001c34fd75de0a84f1136",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_2.png": "10dc41ea6746c96621ce2f13e0bda97d",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_3.png": "5b0e9bb06ac2cf19c96cbf7d6d98212b",
"assets/assets/images/bodices/bodice_flange_inset_step_1.PNG": "27449a6ad6d0b18c5a063c8d10ea5d05",
"assets/assets/images/bodices/bodice_flange_inset_step_2.PNG": "8cb1c416b4073ff9f2d41023aa26edc8",
"assets/assets/images/bodices/bodice_pin_tucks_step_1.PNG": "33ccd3e0d99ff230740f8e928a1a5fb2",
"assets/assets/images/bodices/bodice_pin_tucks_step_2.PNG": "c87c33b0a967de0671d45f19dc7ace34",
"assets/assets/images/bodices/bodice_pin_tucks_step_3.PNG": "83490b3997de9665a552a9747da0fc17",
"assets/assets/images/bodices/bodice_princess_line_step_1.png": "0382422bbe144996c8dbda3234fc0e23",
"assets/assets/images/bodices/bodice_princess_line_step_2.png": "ee12671a04f316f449a013b859781a97",
"assets/assets/images/bodices/bust_semi_yoke_bodice.jpg": "bade3fea25c06535fce15d210c356a2f",
"assets/assets/images/bodices/dart_cluster_bodice.jpg": "ccbe0b1d5f234f2a1e3a67eaa1c1a237",
"assets/assets/images/bodices/double_shoulders_tucks_bodice.jpg": "c41359554d89e6001cb00ea36d074dd5",
"assets/assets/images/bodices/flange_inset_bodice.jpg": "c613fc9c103d67f7072bfb4bd94f0977",
"assets/assets/images/bodices/pin_tucks_bodice.jpg": "da3224dfb1262a9e9bd226d8ade351a7",
"assets/assets/images/bodices/princess_line_bodice.jpg": "a7ca76fe946697cb700094e26f0a9f13",
"assets/assets/images/collars/collar_mandarin_step_1.png": "7b056c65a6d872b9956782f4bfa67a93",
"assets/assets/images/collars/collar_one_piece_shirt_step_1.png": "b76b937bc6b7f6d47dfc2f74432e2fda",
"assets/assets/images/collars/collar_one_piece_shirt_step_2.png": "d4a6a4bd97071da2003526ebd6ae7c2c",
"assets/assets/images/collars/collar_peter_pan_step_1.png": "dc45d114ce8cc9606868c11a707d58d2",
"assets/assets/images/collars/collar_peter_pan_step_2.png": "107daf25cfad13c3c013a78459dc45dc",
"assets/assets/images/collars/collar_sailor_step_1.png": "604764f2752b52068a81ebc8ce75524e",
"assets/assets/images/collars/collar_shawl_step_1.png": "5c431b50e88dd55e981a0f64419dff6d",
"assets/assets/images/collars/collar_shawl_step_2.png": "f1b44981e1a88d2b4e98172f09136c2b",
"assets/assets/images/collars/collar_shawl_step_3.png": "a0d3273c45e9e7687da9e47972481f05",
"assets/assets/images/collars/collar_shawl_step_4.png": "ac1619b7d454d7091bbfa3c61bbd422f",
"assets/assets/images/collars/mandarin_collar.jpg": "9534e84565df5c983b54129eceee0147",
"assets/assets/images/collars/no_collar.jpg": "a23beb1d5ceb3fb71d425daf7bd4fd81",
"assets/assets/images/collars/one_piece_shirt_collar.jpg": "0ae179f52609053e1dcf21ce68ec85ca",
"assets/assets/images/collars/peter_pan_collar.jpg": "5c1b8ceccb7250e3283103cf78b50c87",
"assets/assets/images/collars/sailor_collar.jpg": "35700ac20eefb85e44a323e9e63dbeca",
"assets/assets/images/collars/shawl_collar.jpg": "61dbbc6212f0e50ddab8e105957939a5",
"assets/assets/images/necklines/basic_neckline.jpg": "a23beb1d5ceb3fb71d425daf7bd4fd81",
"assets/assets/images/necklines/boat_neckline.jpg": "313f4764c83bd53ad958bd6cb3198feb",
"assets/assets/images/necklines/cowl_neckline.jpg": "63fe5cd717b84b17aef180439701c2ab",
"assets/assets/images/necklines/crossover_neckline.jpg": "5a79fe3a4b0bc646b0ca08004bb0e685",
"assets/assets/images/necklines/deep_scoop_neckline.jpg": "0200d99c3b12bc59d1805236ee424bfd",
"assets/assets/images/necklines/neckline_boat_step_1.PNG": "a2b9f60d6eb7b2102b549e728bde45d3",
"assets/assets/images/necklines/neckline_cowl_step_1.png": "c487b2c02d30dd1fdb507526e402df89",
"assets/assets/images/necklines/neckline_cowl_step_2.png": "4e3941c01389fabefce9193e257797a3",
"assets/assets/images/necklines/neckline_cowl_step_3.png": "2f652d2129eb0afa2dec19e49b6eadd0",
"assets/assets/images/necklines/neckline_crossover_step_1.png": "4d789f2f302f13d0fcfcfad13900496c",
"assets/assets/images/necklines/neckline_crossover_step_2.png": "2e705d1c63aa7f6e3a033b4ea2c94e56",
"assets/assets/images/necklines/neckline_crossover_step_3.png": "1c14c33720c06e8aa9213009fd0c7a0a",
"assets/assets/images/necklines/neckline_crossover_step_4.png": "ec508de78ce63c5a22dde7a0bf3532b9",
"assets/assets/images/necklines/neckline_deep_scoop_step_1.PNG": "c7a54c33c46aef698d36dd820114c776",
"assets/assets/images/necklines/neckline_v_step_1.PNG": "e72802cc70e69ee416adc5f661846d35",
"assets/assets/images/necklines/v_neckline.jpg": "cd55427373688dc32bb1f04ab3412e31",
"assets/assets/images/skirts/12_gore_graduated_flare_skirt.jpg": "c3d50f0a0869d0a2dafacaaf657f67e8",
"assets/assets/images/skirts/full_circle_skirt.jpg": "b0d01b30ce0267b911b4d2919d5dd12f",
"assets/assets/images/skirts/godets_skirt.jpg": "bbea42df54596ab5c70860772ce01736",
"assets/assets/images/skirts/mermaid_skirt.jpg": "742cb40b44f8c1f4537282f624e93484",
"assets/assets/images/skirts/skirts_with_yoke_skirt.jpg": "c51a62d53746d5acecca5515e815c762",
"assets/assets/images/skirts/tiers_skirt.jpg": "77717105a1a202b53c887edc63116a4a",
"assets/assets/images/sleeves/cap_sleeve.PNG": "d3b3c236725744410971a4a543de210e",
"assets/assets/images/sleeves/circular_hemline_sleeve.JPG": "1a7a82ee290850ab01fca3fe2fb73370",
"assets/assets/images/sleeves/lantern_sleeve.PNG": "69b1512d6670e7f00cfbbc3176a0bc2c",
"assets/assets/images/sleeves/puff_sleeve.PNG": "03ff99de0dca9e7e4022de42253c5c2a",
"assets/assets/images/sleeves/sleeveless_sleeve.jpg": "654bb99c34aaa394fc0c336109291fee",
"assets/assets/images/sleeves/sleeve_cap_step_1.png": "1cd983f7181b12fbd79403389837a909",
"assets/assets/images/sleeves/sleeve_cap_step_2.png": "d0fccd41d44fe57053611c4f8c8d27ac",
"assets/assets/images/sleeves/sleeve_circularhemline_step_1.png": "aaf6915f546555e9bb4e48ba77713d37",
"assets/assets/images/sleeves/sleeve_circularhemline_step_2.png": "e7c35688f5df7bd19312db4180ee58be",
"assets/assets/images/sleeves/sleeve_circularhemline_step_3.png": "e39858a66a350cb62612d8d6d6affcc3",
"assets/assets/images/sleeves/sleeve_lantern_step_1.png": "a1d6c657aef6ad27def3c7b592af66e7",
"assets/assets/images/sleeves/sleeve_lantern_step_2.png": "290109de1ef47c7022d63bfd2125ea18",
"assets/assets/images/sleeves/sleeve_lantern_step_3.png": "b3fa9668e2cec5fddc06d51e640e14a9",
"assets/assets/images/sleeves/sleeve_lantern_step_4.png": "05a34c146f25748d48c746ffeb737965",
"assets/assets/images/sleeves/sleeve_puff_step_1.png": "4d5710b4b59f3a39ffcbdc13154aa766",
"assets/assets/images/sleeves/sleeve_puff_step_2.png": "901a507b401d7e12a362fe31b1c42041",
"assets/assets/images/sleeves/sleeve_puff_step_3.png": "df87258e20b8004aa16203b358dd6128",
"assets/assets/images/sleeves/sleeve_tulip_step_1.png": "f0216dba1720fa83720f4a588c77ca73",
"assets/assets/images/sleeves/sleeve_tulip_step_2.png": "953537c1bc777cdf98ddb7a898386b57",
"assets/assets/images/sleeves/sleeve_tulip_step_3.png": "0db09ed152d600180b014318c6bf9937",
"assets/assets/images/sleeves/tulip_sleeve.PNG": "3ee2f903bf2f6ebcdc0967f451000f33",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "841e6f5a076e208a7276f7125bfa1d08",
"assets/NOTICES": "801b9071543607c1d4f3cca9116d1cee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "87f40f18eda7cd06a57aa7e6d0b2b6a9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6e065ecc8f31ea4a5ad3c88b1db91da3",
"/": "6e065ecc8f31ea4a5ad3c88b1db91da3",
"main.dart.js": "975fa8a7926fab5b5a1f506e98ccda0f",
"manifest.json": "e28d8c932fa7b513d393bf8f693aa907",
"version.json": "6c6dad6b41e06989039f580f5434cfc8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
