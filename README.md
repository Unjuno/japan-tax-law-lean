# Japan Tax Law in Lean 4 / 日本税法の形式検証

[![Lean CI](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml/badge.svg)](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml)

日本の税法を **Lean 4** で段階的に形式化し、条文・定義・特例の境界条件、相互整合性、改正に伴う回帰を機械的に検証する研究・オープンソースプロジェクトです。

> **現状：初期の概念実証（PoC）です。日本の税法に不備が見つかったと主張するものではありません。** Lean が証明するのは、与えられた形式モデルの内部における命題であり、モデルが法令の意味を正しく表すこと自体は自動的に保証されません。

## 最初の対象

**所得税法（昭和40年法律第33号）第2条第1項第3号・第5号**の「居住者」「非居住者」の定義を、二つの判定済みの真偽値を入力とする最小モデルとして実装します。

- 第3号：国内に住所を有する場合、または現在まで引き続いて1年以上国内に居所を有する場合をモデル化。
- 第5号：非居住者を「居住者ではない個人」としてモデル化。
- 居住者／非居住者の分類が**網羅的**かつ**相互排他的**であることを証明し、入力4通りをテスト。
- 「住所」「居所」「1年以上」の法的判定過程や、**第3条の公務員に関する擬制、政令、条約等は未形式化**。このモデルを現実の個人の税務判定に使用しないでください。

## 根拠資料

- [e-Gov 法令検索：所得税法（法令ID 340AC0000000033）](https://laws.e-gov.go.jp/law/340AC0000000033/)
- [国税庁 No.2875 居住者と非居住者の区分（令和8年4月1日現在法令等）](https://www.nta.go.jp/taxes/shiraberu/taxanswer/gensen/2875.htm)
- [国税庁 No.2010 納税義務者となる個人（令和8年4月1日現在法令等）](https://www.nta.go.jp/taxes/shiraberu/taxanswer/shotoku/2010.htm)

条文は**施行日によって内容が変わり得る**ため、今後の各モデル・検証報告には対象法令の版・施行日・参照URLを必ず明記します。追加の出典・判定基準は [docs/METHODOLOGY.md](docs/METHODOLOGY.md) を参照。

## 開発環境・検証

- Lean 4: `leanprover/lean4:v4.35.0`（`lean-toolchain` で固定）
- Lake: 同梱バージョン、外部Leanライブラリ依存なし
- CI: GitHub Actions / `leanprover/lean-action@v1`

```sh
git clone https://github.com/Unjuno/japan-tax-law-lean.git
cd japan-tax-law-lean
lake build
```

`lake build` は `JapanTaxLaw.lean` 経由で仕様・定理・4通りのテストを検査します。GitHub Actionsで同じビルドを実行します。

## リポジトリ構成

```text
JapanTaxLaw.lean                 # ライブラリのエントリーポイント
JapanTaxLaw/Residency.lean       # 所得税法第2条の限定的形式モデルと定理
JapanTaxLaw/Tests.lean           # 入力組合せの境界テスト
docs/METHODOLOGY.md             # 法令・モデルの対応づけ、発見の査読基準
.github/workflows/lean.yml      # Lean CI
lakefile.toml / lean-toolchain  # 再現可能なビルド
```

## 発見報告のルール

「矛盾」「抜け穴」「誤記」を称する前に、**(1) 法令・施行日時点、(2) 原文の参照箇所、(3) 形式化の前提、(4) 再現可能な証明／反例、(5) 別解釈・適用除外の検討、(6) 人による法的レビュー**を提示します。

**ビルド成功 ≠ 法令の正確な形式化 ≠ 現実の法的問題の発見** です。

## コントリビュート

貢献方法と検証基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コードは MIT ライセンスです。法的助言の提供を目的としません。
