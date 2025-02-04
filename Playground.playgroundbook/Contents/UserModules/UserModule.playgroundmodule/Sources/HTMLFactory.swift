import Foundation
import Ink
import Plot
import Publish

extension A2 {
    public static var theme: Theme<Website> {
        Theme(htmlFactory: HTMLFactory(), resourcePaths: [], file: "HTMLFactory.swift")
    }

    private struct HTMLFactory: Publish.HTMLFactory {
        func makeStylesCSS(context: PublishingContext<Website>) throws -> String {
            let sass = """
@function unit($value) {
  @return 0.02rem * $value;
}

:root {
  --background-color: #fff;
  --blockquote-background-color: #{rgba(#787880, 20%)};
  --elevated-background-color: #fff;
  --horizontal-rule-color: #c6c6c8;
  --link-color: #0A7AFF;
  --mail-button-color: #3478F6;
  --mail-button-invalid-color: #dbdbdc;
  --mail-input-placeholder-color: #{rgba(#3c3c43, 30%)};
  --mail-label-text-color: #8a8a8d;
  --navigation-bar-backdrop-filter: blur(20px) saturate(100%);
  --navigation-bar-background-color: #{rgba(#f9f9f9, 94%)};
  --navigation-bar-border-color: #{rgba(#000, 30%)};
  --search-bar-background-color: #{rgba(#767680, 12%)};
  --search-bar-text-color: #000;
  --status-bar-color: #000;
  --text-color: #000;
  --toolbar-background-color: #{rgba(#f9f9f9, 94%)};
  --toolbar-border-color: #{rgba(#000, 30%)};
  --toolbar-disabled-item-color: #BFBFBF;
  --toolbar-item-color: #0A7AFF;
  --unelevated-background-color: #e0e0e0;

  @media (prefers-color-scheme: dark) {
    --background-color: #000;
    --blockquote-background-color: #{rgba(#787880, 36%)};
    --elevated-background-color: #1c1c1e;
    --horizontal-rule-color: #3d3d41;
    --link-color: #0084FF;
    --mail-button-color: #3b82f6;
    --mail-button-invalid-color: #414144;
    --mail-input-placeholder-color: #{rgba(#ebebf5, 30%)};
    --mail-label-text-color: #98989e;
    --navigation-bar-backdrop-filter: blur(20px) saturate(130%);
    --navigation-bar-background-color: #{rgba(#1d1d1d, 94%)};
    --navigation-bar-border-color: #{rgba(#fff, 15%)};
    --search-bar-background-color: #{rgba(#767680, 24%)};
    --search-bar-text-color: #fff;
    --status-bar-color: #fff;
    --text-color: #fff;
    --toolbar-background-color: #{rgba(#161616, 80%)};
    --toolbar-border-color: #{rgba(#fff, 16%)};
    --toolbar-disabled-item-color: #4D4D4D;
    --toolbar-item-color: #5A91F7;
    --unelevated-background-color: #141415;
  }
}

html {
  background: var(--background-color);
  color: var(--text-color);
}

body {
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
  font-size: 16px;
  margin: 2.5rem;
}

a {
  color: var(--link-color);
  text-decoration: none;
}

footer {
  margin-bottom: 2.5rem;
  text-align: center;
}

.target {
  left: 0;
  position: absolute;
  top: 0;
}

.content {
  display: flex;
  margin: 0 auto;
  width: 61rem;

  h1, h2 {
    margin: 0;
  }

  p {
    line-height: 1.5;
  }
}

.text-content {
  margin-left: 2.5rem;
  min-width: 32rem;
}

.content-default {
  blockquote {
    background: var(--blockquote-background-color);
    border-radius: 1rem;
    margin: 0;
    padding: 1rem;

    p {
      margin: 0;
    }
  }
}

$transition-duration: 0.4s;
@media (prefers-reduced-motion) {
  .animated {
    transition: none !important;
  }
}

.phone {
  background: #233a4a;
  border-radius: unit(205);
  box-shadow: inset 0 0 unit(3) unit(2) rgba(0, 0, 0, 0.5), inset 0 0 unit(2) unit(5) #203747, inset 0 0 unit(2) unit(8) #ADCEE4, inset 0 unit(1) unit(4) unit(10) rgba(0, 0, 0, 0.35);
  flex-shrink: 0;
  font-size: unit(36);
  height: unit(2658);
  position: relative;
  width: unit(1296);

  &::before, &::after {
    border-radius: unit(183);
    content: "";
  }

  &::before {
    background: #2e2c2a;
    box-shadow: unit(-6) 0 unit(3) 0 rgba(255, 255, 255, 0.08), 0 0 unit(2) unit(1) rgba(0, 0, 0, 0.6), inset 0 0 unit(1) unit(1) rgba(0, 0, 0, 0.5);
    height: calc(100% - #{unit(36)});
    position: absolute;
    top: unit(18);
    left: unit(18);
    width: calc(100% - #{unit(36)});
  }

  &::after {
    background: #000;
    height: calc(100% - #{unit(42)});
    top: unit(21);
    left: unit(21);
    position: absolute;
    width: calc(100% - #{unit(42)});
  }

  .buttons {
    * {
      border-radius: unit(2);
      box-shadow: inset unit(-10) 0 unit(3) 0 rgba(0, 0, 0, 0.4), inset unit(2) 0 unit(1) 0 rgba(0, 0, 0, 0.6), inset 0 unit(3) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(-3) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(6) unit(1) 0 #BDE1F7, inset 0 unit(-6) unit(1) 0 #BDE1F7, inset unit(4) 0 unit(1) 0 #BDE1F7;
      position: absolute;
      width: unit(17);
      z-index: -1;
    }

    .power {
      background: linear-gradient(0deg, #0B212B 3%, #668091 8%, #668192 93%, #11232E 98%);
      border-radius: unit(4);
      box-shadow: inset unit(-10) 0 unit(3) 0 rgba(0, 0, 0, 0.4), inset unit(2) 0 unit(1) 0 rgba(0, 0, 0, 0.6), inset 0 unit(3) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(-3) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(6) unit(1) 0 #BDE1F7, inset 0 unit(-6) unit(1) 0 #BDE1F7, inset unit(4) 0 unit(1) 0 #BDE1F7;
      height: unit(316);
      right: unit(-8.5);
      top: unit(681);
    }

    .mute {
      background: linear-gradient(0deg, #0B212B 5%, #668091 14%, #668192 86%, #11232E 96%);
      box-shadow: inset unit(-9) 0 unit(3) 0 rgba(0, 0, 0, 0.5), inset unit(1) 0 unit(1) 0 rgba(0, 0, 0, 0.6), inset 0 unit(2) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(-2) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(4) unit(1) 0 #BDE1F7, inset 0 unit(-4) unit(1) 0 #BDE1F7, inset unit(3) 0 unit(1) 0 rgba(189,225,247, 0.75);
      height: unit(100);
      left: unit(-8.5);
      top: unit(422);
    }

    .volume-up,
    .volume-down {
      background: linear-gradient(0deg, #0B212B 5%, #668091 10%, #668192 90%, #11232E 96%);
      box-shadow: inset unit(-11) 0 unit(3) 0 rgba(0, 0, 0, 0.5), inset unit(1) 0 unit(1) 0 rgba(0, 0, 0, 0.6), inset 0 unit(2) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(-2) unit(2) 0 rgba(0, 0, 0, 0.85), inset 0 unit(4) unit(1) 0 #BDE1F7, inset 0 unit(-4) unit(1) 0 #BDE1F7, inset unit(3) 0 unit(1) 0 rgba(189, 225, 247, 0.75);
      height: unit(200);
      left: unit(-8.5);
    }

    .volume-up {
      top: unit(613);
    }

    .volume-down {
      top: unit(867);
    }
  }

  .bands {
    * {
      opacity: 0.8;
      width: unit(19);
      height: unit(18);
      position: absolute;
    }

    .right {
      right: 0;
    }

    .left {
      left: 0;
    }

    .bottom.left,
    .bottom.right {
      bottom: unit(269);
    }

    .bottom.right {
      background: #3C494F;
    }

    .bottom.center {
      background: #39464E;
      width: unit(18);
      height: unit(19);
      left: unit(262);
      bottom: 0;
    }

    .bottom.left {
      background: #3C464F;
      width: unit(19);
      height: unit(17);
    }

    .top.left,
    .top.right {
      top: unit(269);
    }

    .top.center {
      background: #59656F;
      top: 0;
      right: unit(259);
    }

    .top.left {
      background: #56646C;
    }

    .top.right {
      background: #57646C;
    }
  }

  .display {
    border-radius: unit(142);
    width: unit(1170);
    height: unit(2532);
    position: absolute;
    top: unit(63);
    left: unit(63);
    background: black;
    z-index: 1;
    overflow: hidden;

    .notch {
      background-color: #000;
      border-radius: 0 0 unit(66) unit(66);
      content: "";
      height: unit(95.5);
      left: 50%;
      transform: translateX(-50%);
      position: absolute;
      top: 0;
      width: unit(632);
      z-index: 2;

      &::before,
      &::after {
        background-image: radial-gradient(circle at 0 100%, transparent unit(18), #000 unit(18));
        background-repeat: no-repeat;
        background-size: 50% 100%;
        content: "";
        height: unit(18);
        left: unit(-18);
        position: absolute;
        top: 0;
        width: unit(36);
      }

      &::after {
        background-image: radial-gradient(circle at 100% 100%, transparent unit(18), #000 unit(18));
        left: 100%;
      }
    }

    .homescreen {
      color: #fff;
      display: flex;
      flex-direction: column;
      height: 100%;
      transition: $transition-duration filter;
      width: 100%;

      :target ~ & {
        filter: blur(30px) brightness(0.5);
      }

      .background {
        border-radius: unit(142);
        background: url("/images/background.jpg") center/115% no-repeat;
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        width: 100%;

        @media (prefers-color-scheme: dark) {
          background-image: url("/images/background~dark.jpg");
        }
      }

      .icons {
        flex: 1;
        margin-top: unit(231);
        transition-duration: $transition-duration;
        transition-property: transform, opacity;
        width: 100%;

        :target ~ & {
          transform: scale(0.8);
          opacity: 0.8;
        }
      }
    }
  }

  .status-bar {
    color: #fff;
    display: flex;
    flex-direction: row;
    font-size: unit(48);
    font-weight: 500;
    height: unit(144);
    justify-content: space-between;
    position: absolute;
    transition: $transition-duration color;
    width: 100%;
    z-index: 2;

    > * {
      align-self: center;
      text-align: center;
      width: unit(312);
    }

    .status {
      height: unit(36);
    }

    .path-fill {
      transition: $transition-duration fill;
    }

    .path-stroke {
      transition: $transition-duration stroke;
    }
  }

  .icons ul {
    column-gap: unit(30);
    margin: 0 unit(60);
    row-gap: unit(54);

    li {
      width: unit(240);

      a {
        color: #fff;
        text-decoration: none;
        text-overflow: clip;
      }
    }
  }

  .icons ul,
  .dock ul {
    list-style: none;
    padding-left: 0;
    display: grid;
    grid-template-columns: repeat(4, 1fr);

    li {
      overflow: hidden;
      padding-top: unit(192);
      position: relative;
      text-align: center;
      text-overflow: ellipsis;
    }
  }

  .dock {
    -webkit-backdrop-filter: blur(30px) saturate(110%);
    backdrop-filter: blur(30px) saturate(110%);
    background: rgba(255, 255, 255, 0.3);
    border-radius: unit(93);
    height: unit(287);
    margin: unit(36);

    .app::before {
      left: 0;
    }

    ul {
      column-gap: unit(90);
      margin: unit(51) unit(42);

      li {
        font-size: unit(0);
        width: unit(180);
      }
    }
  }

  .screen {
    background-size: cover;
    border-radius: unit(141);
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    text-indent: -9999rem;
    top: 0;
    transform: scale(0.1);
    transition-duration: $transition-duration;
    transition-property: opacity, transform, z-index;
    width: 100%;
    z-index: -1;
  }

  .screen-mail {
    background: #000;

    input, textarea {
      background: transparent;
      color: var(--text-color);
      font-size: unit(48);

      &::placeholder {
        color: var(--mail-input-placeholder-color);
      }
    }

    hr {
      margin: 0 unit(50);
      border: 0;
      border-top: unit(1) solid var(--horizontal-rule-color);
    }

    .page {
      border-radius: unit(30);
      bottom: 0;
      position: absolute;

      &.foreground {
        background: var(--elevated-background-color);
        height: calc(100% - #{unit(170)});
        width: 100%;
        z-index: 1;
      }

      &.background {
        background: var(--unelevated-background-color);
        width: calc(100% - #{unit(48)});
        height: calc(100% - #{unit(140)});
        left: unit(24);
        border-radius: unit(30);
      }
    }

    form {
      font-size: unit(48);
    }

    .captcha-container {
      display: flex;
      justify-content: center;
    }

    .fieldset {
      padding: unit(40) 0;
      margin: 0 unit(50);

      &.flex {
        display: flex;
      }

      label, .label {
        color: var(--mail-label-text-color);
        margin-right: unit(16);
      }

      textarea {
        border: 0;
        font-family: inherit;
        height: unit(900);
        padding: 0;
        resize: none;
        width: 100%;
      }

      .signature {
        margin-top: unit(16);
      }

      input {
        flex: 1;
        border: 0;
        padding: 0;
        margin: 0;
      }
    }

    .cancel {
      color: var(--mail-button-color);
      display: inline-block;
      margin: unit(65) unit(50);
      font-size: unit(48);
      text-decoration: none;
    }

    .header {
      display: flex;
      padding: unit(40) unit(50);

      .title {
        flex: 1;
        font-weight: bold;
        display: block;
        font-size: unit(96);
      }
    }

    .submit {
      background: transparent;
      border: 0;
      height: unit(107);
      padding: 0;
      width: unit(108);

      svg {
        height: 100%;
        width: 100%;
      }

      path {
        fill: var(--mail-button-invalid-color);
        transition: $transition-duration fill;
      }
    }

    form:valid .submit {
      cursor: pointer;

      path {
        fill: var(--mail-button-color);
      }
    }
  }

  .screen-safari {
    background: #fff;
    color: #000;

    .navigation-bar {
      -webkit-backdrop-filter: var(--navigation-bar-backdrop-filter);
      background: var(--navigation-bar-background-color);
      backdrop-filter: var(--navigation-bar-backdrop-filter);
      border-bottom: unit(1) solid var(--navigation-bar-border-color);
      height: unit(300);
      left: 0;
      position: absolute;
      top: 0;
      width: 100%;
      z-index: 1;
    }

    .search-bar {
      background: var(--search-bar-background-color);
      border-radius: unit(30);
      color: var(--search-bar-text-color);
      font-size: unit(51);
      height: unit(108);
      left: unit(29);
      position: absolute;
      text-align: center;
      top: unit(153);
      width: calc(100% - #{unit(58)});
      display: flex;
      z-index: 1;

      > div {
        align-self: center;
        flex: 1;
      }
    }

    .toolbar {
      width: calc(100% - #{unit(48)});
      height: unit(133);
      left: 0;
      bottom: 0;
      position: absolute;
      display: flex;
      justify-content: space-between;
      padding: unit(9) unit(24) unit(108);
      -webkit-backdrop-filter: blur(20px) saturate(100%);
      background: var(--toolbar-background-color);
      backdrop-filter: blur(20px) saturate(100%);
      border-top: unit(1) solid var(--toolbar-border-color);

      svg {
        height: unit(132);
        width: unit(132);
      }

      > a svg path {
        fill: var(--toolbar-item-color);
      }

      > svg path {
        fill: var(--toolbar-disabled-item-color);
      }
    }

    .iframe-container {
      width: 100%;
      height: 100%;
      position: absolute;
    }

    iframe {
      $scale: 0.5;
      background-color: var(--background-color);
      padding-bottom: unit(250) / $scale;
      padding-top: unit(300) / $scale;
      width: 100% / $scale;
      height: calc(#{100% / $scale} - #{unit(550) / $scale});
      transform: scale($scale);
      transform-origin: 0 0;
    }
  }

  .home-indicator, .screen-bean::after, .screen-potluck::after {
    background: #000;
    border-radius: unit(7.5);
    bottom: unit(30);
    height: unit(15);
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: unit(417);
  }

  .screen-mail .home-indicator, .screen-safari .home-indicator {
    background: var(--status-bar-color);
  }

  .screen-bean::after, .screen-potluck::after {
    background: #fff;
    content: "";
  }

  .app::before {
    $mask: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="1.4" clip-rule="evenodd" viewBox="0 0 460 460"%3E%3Cpath d="M460 316v30a202 202 0 01-3 31c-2 10-5 19-9 28a97 97 0 01-43 43 102 102 0 01-28 9c-10 2-20 3-31 3a649 649 0 01-13 0H127a649 649 0 01-13 0 201 201 0 01-31-3c-10-2-19-5-28-9a97 97 0 01-43-43 102 102 0 01-9-28 202 202 0 01-3-31v-13-189-17-13a202 202 0 013-31c2-10 5-19 9-28a97 97 0 0143-43 102 102 0 0128-9 203 203 0 0144-3h206a649 649 0 0113 0c11 0 21 1 31 3s19 5 28 9a97 97 0 0143 43 102 102 0 019 28 202 202 0 013 31 643 643 0 010 30v172z"/%3E%3C/svg%3E') center/100% 100% no-repeat;
    -webkit-mask: $mask;
    background: url("/images/icons/blank.png") center/cover;
    content: "";
    height: unit(180);
    left: unit(30);
    mask: $mask;
    position: absolute;
    top: 0;
    width: unit(180);
  }
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .darkContent }.map { app in "#\(app.id):target ~ .phone .status-bar" }.joined(separator: ",\n")) {
  color: #000;
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .darkContent }.map { app in "#\(app.id):target ~ .phone .status-bar .path-fill" }.joined(separator: ",\n")) {
  fill: #000;
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .darkContent }.map { app in "#\(app.id):target ~ .phone .status-bar .path-stroke" }.joined(separator: ",\n")) {
  stroke: #000;
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .adaptive }.map { app in "#\(app.id):target ~ .phone .status-bar" }.joined(separator: ",\n")) {
  color: var(--status-bar-color);
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .adaptive }.map { app in "#\(app.id):target ~ .phone .status-bar .path-fill" }.joined(separator: ",\n")) {
  fill: var(--status-bar-color);
}

\(context.site.apps.filter { app in !(app is StubApp) && app.screen.statusBarStyle == .adaptive }.map { app in "#\(app.id):target ~ .phone .status-bar .path-stroke" }.joined(separator: ",\n")) {
  stroke: var(--status-bar-color);
}

\(context.site.apps.map { app in """
.phone .app-\(app.id)::before {
  background-image: url("/images/icons/\(app.id).png");
}
""" }.joined(separator: "\n\n"))

\(context.site.apps.filter { app in app is DefaultApp }.map { app in """
.phone .screen-\(app.id) {
  background-image: url("/images/screens/\(app.id).jpg");\((try? context.outputFile(at: "/images/screens/\(app.id)~dark.jpg")) == nil ? "" : """

  @media (prefers-color-scheme: dark) {
    background-image: url("/images/screens/\(app.id)~dark.jpg");
  }
""")
}
""" }.joined(separator: "\n\n"))

\(context.site.apps.filter { app in !(app is StubApp || app is DefaultApp) }.map { app in ".phone .screen-\(app.id)" }.joined(separator: ", ")) {
  overflow: hidden;
  text-indent: unset;
}

\(context.site.apps.filter { app in !(app is StubApp) }.map { app in ".content-\(app.id)" }.joined(separator: ", ")) {
  display: none;
}

\(context.site.apps.filter { app in !(app is StubApp || app is MailApp || app is SafariApp) }.map { app in "#\(app.id):target ~ .text-content .content-default" }.joined(separator: ", ")) {
  display: none;
}

\(context.site.apps.filter { app in !(app is StubApp) }.map { app in "#\(app.id):target ~ .text-content .content-\(app.id)" }.joined(separator: ", ")) {
  display: unset;
}

\(context.site.apps.filter { app in !(app is StubApp) }.map { app in "#\(app.id):target ~ .phone .screen-\(app.id)" }.joined(separator: ", ")) {
  opacity: unset;
  transform: unset;
  z-index: 1; // bug in Chrome: use `1` not `unset`
}
"""

            let archiveResource: LocalResource = #fileLiteral(resourceName: "sass.dart.js") // sass.dart.js
            return try Sass(scriptSource: String(contentsOf: archiveResource.fileURL))
                .compileSync(styles: sass, options: Sass.Options(outputStyle: .compressed))
        }

        func makeIndexHTML(for index: Index, context: PublishingContext<Website>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site, inlineStyles: [try makeStylesCSS(context: context)]),
                .body {
                    ContentWrapper {
                        ComponentGroup(members: context.site.apps.filter { app in !(app is StubApp) }.map { app in
                            Div()
                                .class("target")
                                .id(app.id)
                        })

                        Phone(apps: context.site.apps)

                        Div {
                            H1(context.site.name)

                            Div(index.body)
                                .class("content-default")

                            let parser = MarkdownParser()
                            ComponentGroup(members: context.site.apps.filter { app in app.location == .homescreen }.compactMap { app in
                                guard let markdownPath = app.markdownPath else {
                                    return nil
                                }

                                let file = try! context.file(at: markdownPath)
                                let contents = try! file.readAsString()
                                let markdown = parser.parse(contents)

                                return Div {
                                    H2(markdown.metadata["title"] ?? app.name)
                                    Div.init(html: markdown.html)
                                    Link("← Back", url: "#")
                                }
                                .class("content-\(app.id)")
                            })

                            SiteFooter()
                        }
                        .class("text-content")
                    }
                }
            )
        }

        func makeSectionHTML(for section: Section<Website>, context: PublishingContext<Website>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site, stylesheetPaths: []),
                .body {
                    SiteHeader(context: context, selectedSelectionID: section.id)
                    ContentWrapper {
                        H1(section.title)
                        ItemList(items: section.items, site: context.site)
                    }
                    SiteFooter()
                }
            )
        }

        func makeItemHTML(for item: Item<Website>, context: PublishingContext<Website>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site, stylesheetPaths: []),
                .body(
                    .class("item-page"),
                    .components {
                        SiteHeader(context: context, selectedSelectionID: item.sectionID)
                        ContentWrapper {
                            Article {
                                Div(item.content.body).class("content")
                                Span("Tagged with: ")
                                ItemTagList(item: item, site: context.site)
                            }
                        }
                        SiteFooter()
                    }
                )
            )
        }

        func makePageHTML(for page: Page, context: PublishingContext<Website>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site, stylesheetPaths: []),
                .body {
                    SiteHeader(context: context, selectedSelectionID: nil)
                    ContentWrapper(page.body)
                    SiteFooter()
                }
            )
        }

        func makeTagListHTML(for page: TagListPage, context: PublishingContext<Website>) throws -> HTML? {
            nil
        }

        func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Website>) throws -> HTML? {
            nil
        }
    }
}

extension Node where Context == HTML.DocumentContext {
    static func head<T: Website>(
        for location: Location,
        on site: T,
        titleSeparator: String = " | ",
        inlineStyles: [String] = [],
        stylesheetPaths: [Path] = []
    ) -> Node {
        var title = location.title
        if title.isEmpty {
            title = site.name
        } else {
            title.append(titleSeparator + site.name)
        }

        var description = location.description
        if description.isEmpty {
            description = site.description
        }

        return .head(
            .encoding(.utf8),
            .siteName(site.name),
            .url(site.url(for: location)),
            .title(title),
            .description(description),
            .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
            .forEach(stylesheetPaths, { .stylesheet($0) }),
            .meta(.name("viewport"), .content("width=1100")),
            .unwrap(site.favicon, { .favicon($0) }),
            .link(.rel(.maskIcon), .href("/favicon.svg"), .attribute(named: "color", value: "black")),
            .unwrap(location.imagePath ?? site.imagePath, { path in
                let url = site.url(for: path)
                return .socialImageLink(url)
            }),
            .forEach(inlineStyles, { .style($0) }),
            .script(.src("//gc.zgo.at/count.js"), .data(named: "goatcounter", value: "https://a2io.goatcounter.com/count"))
        )
    }
}

private struct ContentWrapper: ComponentContainer {
    var content: ContentProvider

    init(@ComponentBuilder content: @escaping ContentProvider) {
        self.content = content
    }

    @ComponentBuilder var body: Component {
        Div(content: content)
            .class("content")
    }
}

private struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?

    @ComponentBuilder var body: Component {
        Header {
            ContentWrapper {
                Link(context.site.name, url: "/")
                    .class("site-name")

                if Site.SectionID.allCases.count > 1 {
                    navigation
                }
            }
        }
    }

    @ComponentBuilder private var navigation: Component {
        Navigation {
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]
                return Link(section.title, url: section.path.absoluteString)
                    .class(sectionID == selectedSelectionID ? "selected" : "")
            }
        }
    }
}

private struct ItemList<Site: Website>: Component {
    var items: [Item<Site>]
    var site: Site

    @ComponentBuilder var body: Component {
        List(items) { item in
            Article {
                H1(Link(item.title, url: item.path.absoluteString))
                ItemTagList(item: item, site: site)
                Paragraph(item.description)
            }
        }
        .class("item-list")
    }
}

private struct ItemTagList<Site: Website>: Component {
    var item: Item<Site>
    var site: Site

    @ComponentBuilder var body: Component {
        List(item.tags) { tag in
            Link(tag.string, url: site.path(for: tag).absoluteString)
        }
        .class("tag-list")
    }
}

private struct SiteFooter: Component {
    @ComponentBuilder var body: Component {
        Footer {
            Paragraph {
                Text("Generated with ")
                Link("Swift Playgrounds", url: "https://github.com/a2/site-playground")
                    .data(named: "goatcounter-click", value: "github")
            }
        }
    }
}
