import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import loadScript from 'discourse/lib/load-script';

export default class BarsCustomHtmlComponent extends Component {

  @action
  async loadAdScript() {
    let adsbygoogle;
    await loadScript(`https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${this.args.params.ad_client}`);
    (adsbygoogle = window.adsbygoogle || []).push({});
  }

  <template>
    <ins class="adsbygoogle"
     style="display:block"
     data-ad-client={{this.args.params.ad_client}}
     data-ad-slot={{this.args.params.ad_slot}}
     data-ad-format={{this.args.params.ad_format}}
     data-full-width-responsive="true"
     {{didInsert this.loadAdScript}}></ins>
  </template>
}
