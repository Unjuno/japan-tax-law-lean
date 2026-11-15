# Japan Tax Law in Lean 4 / 日本税法の形式検証

[![Lean CI](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml/badge.svg)](https://github.com/Unjuno/japan-tax-law-lean/actions/workflows/lean.yml)

日本の税法を **Lean 4** で段階的に形式化し、条文・定義・特例の境界条件、相互整合性、改正に伴う回帰を機械的に検証する研究・オープンソースプロジェクトです。

> **現状：初期の概念実証（PoC）です。日本の税法に不備が見つかったと主張するものではありません。** Lean が証明するのは、与えられた形式モデルの内部における命題であり、モデルが法令の意味を正しく表すこと自体は自動的に保証されません。

## R1 実装範囲

**対象法令の版（2026-11-15 現在の適用版）を固定し、以下を機械的に検証します。**

### 所得税法第2条第1項第3号・第5号・第3条、所得税法施行令第13条〜第15条

JapanTaxLaw/StatutoryModel.lean では、居住者／非居住者の判定を四値論理（Verdict）で形式化します。
認定事実／不明／矛盾を区別し、**不明を偽として処理しません**。

- 第2条第1項第3号：国内に住所を有する場合、または現在まで引き続いて1年以上国内に居所を有する場合をモデル化。
- 第2条第1項第5号：非居住者は「居住者ではない個人」としてモデル化。
- 第3条・第3項の**公務員擬制**と**政令で定める者の除外（施行令13条）**をモデル化。
- **施行令14条の推定（国内住所の推定）**、**施行令15条の推定（国外住所の推定）**をモデル化。
- 対象条文が法10条・15条・16条の場合は擬制の適用外として扱います。

JapanTaxLaw/ResidencySpec.lean で**実装と独立した形式仕様**（spec）と、健全性・整合性・例外適用範囲の定理を証明しています（後述）。

### 構造監査（e-Gov 法令本文の機械検査）

scripts/law_audit/ は、2026-11-15 適用版の**所得税法**（法令ID 340AC0000000033）と
**所得税法施行令**（法令ID 340CO0000000096）について、次を検査する Python ツールです。
原文は data/raw/ に SHA-256 ハッシュ付きで保存し、PDF 生成 URL は e-Gov API v2 から取得します。

- 条・項・号・枝番号の参照先（未解決参照は candidate として報告、断定しない）
- 番号重複・欠落・逆転・削除された条文からの参照
- 項の重複・欠落・整序
- 括弧の対応・引用符の対応
- 目次（TOC）の条号範囲と本文の span 整合性
- 参照は「他律法（法人税法・国税通則法等）」「附則からの参照」を区別し、未解決でも誤りと断定しない

**未対応範囲**（明示）:
- 別表の内容意味検査は未対応。
- 「附則第○条」参照は対応する附則存在性までしか検査しない。
- 非永住者（第2条第1項第4号）・租税条約・非永住者特有規則は R1 対象外。

### 監査レポートの生成

```sh
python -m scripts.law_audit.audit --out build     # 誤検証結果を build/ に出力
python -m scripts.law_audit.report                # docs/AUDIT_REPORT.md を生成
python -m unittest scripts.tests.test_structural_audit   # 35 テスト
python -m unittest scripts.tests.test_mutation_injection # 11 誤変更注入検出テスト
```

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
JapanTaxLaw/Residency.lean       # PoC: 所得税法第2条の限定的形式モデルと定理（維持）
JapanTaxLaw/Verdict.lean         # 四値論理（Verdict）と各種結合子・冪等律
JapanTaxLaw/StatutoryModel.lean  # 四値論理による居住者判定本体・擬制・除外・推定・分類
JapanTaxLaw/ResidencySpec.lean   # 形式仕様（spec）と健全性・整合性の定理
JapanTaxLaw/Excluded.lean        # 公務員擬制の除外が成立する条件（enum-level）
JapanTaxLaw/VerdictLemmas.lean   # 四値論理の小さな同値補題集
JapanTaxLaw/Tests.lean           # 30件の境界・回帰テスト
scripts/law_audit/               # 構造監査エンジン（Python）
scripts/tests/                   # 構造監査テスト 35件 ＋ 誤変更注入検出テスト 12件
data/raw/                        # e-Gov API v2 から取得した適用版XML＋ハッシュ
data/PROVENANCE.json             # 法令ID・履歴ID・施行日・SHA-256
docs/METHODOLOGY.md              # 法令・モデルの対応づけ、発見の査読基準
docs/AUDIT_REPORT.md             # 監査レポート（生成物）
.github/workflows/lean.yml      # Lean ビルド・公理検査・構造監査・誤変更注入のCI
lakefile.toml / lean-toolchain  # 再現可能なビルド
```

## Phase A — 全法令インベントリ（完了）

対象法令台帳 `data/INVENTORY.json` を構築しました（2026-11-15 時点・公式法令一覧基準）。

- 母集団：e-Gov 公式全現行法令一覧（`/api/1/lawlists/1`、現行法令 9,001 件、sha256 を `data/INVENTORY.json` に記録）から「税」を含む **327 件**（法律 74・政令 113・省令/府令 140）を決定論的に抽出
- 現行版の確定：**325 / 327 件**について 2026-11-15 時点の適用版を確定
  - 324 件は `CurrentEnforced`（内 1 件は PreviousEnforced への退行記録を含むが監査不可として `audit_ready=False`）
  - **完全未施行の 2 件**（防衛特別所得税関連の政令・省令）は未確定のまま台帳へ記録し、検証対象から除外
  - 1 件は Historical fallback（e-Gov が `CurrentEnforced` を返さないため）と明示
- 版・施行日・改正履歴・原文ハッシュ：確定済み 325 件全件の原文 JSON と改正履歴 JSON を `data/raw/` に保存し SHA-256 を `data/INVENTORY.json` に記録（改正履歴 325 件ピン留め・ハッシュ照合済み）
- 参照関係の収集（走査可能な原文からの形式的抽出のみ）：参照抽出 461,067 件（うち内部解決 81,779 / 外部未解決 161,664 / 未対応 237,132）。**外部未解決・未対応を誤りとして断定しません**
- 未登録の範囲（地方税条例・租税条約・通達・裁判例）は、それぞれ独立した法源/解釈レイヤーとして台帳上 `unsupported` と明記します

検証スクリプト：

```sh
python scripts/law_audit/inventory/build_inventory.py --fetch-raw   # 取得（ネットワーク必要）
python scripts/law_audit/inventory/pin_revisions.py                 # 改正履歴ピン留め＋照合
python scripts/law_audit/inventory/validate_inventory.py             # 台帳の整合検証（オフライン）
python -m unittest scripts.tests.test_inventory_selection            # 7 テスト
```

## R1 の検証結果（2026-11-15 時点）

- **`lake build`**: 成功（Lean v4.35.0、依存なし）
- **構造監査**: 所得税法 1,286 条文・所得税法施行令 1,142 条文を機械検査
- **意味モデル**: 実装:ジェネラリティを 3 種の網羅パターン（居住者／非居住者／不明）に分解して証明
- **監査結果**: `verified-anomaly` **0 件**、`candidate` 24 件（すべて**未確定**、独立レビュー未実施）
- **詳細**: [docs/AUDIT_REPORT.md](docs/AUDIT_REPORT.md)
- **公理依存**: 主要定理は `propext` のみ（`sorry` 未使用）

## 発見報告のルール

「矛盾」「抜け穴」「誤記」を称する前に、**(1) 法令・施行日時点、(2) 原文の参照箇所、(3) 形式化の前提、(4) 再現可能な証明／反例、(5) 別解釈・適用除外の検討、(6) 人による法的レビュー**を提示します。

**ビルド成功 ≠ 法令の正確な形式化 ≠ 現実の法的問題の発見** です。

## コントリビュート

貢献方法と検証基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。コードは MIT ライセンスです。法的助言の提供を目的としません。
