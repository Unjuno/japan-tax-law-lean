### TwoOrMorePortMunicipalities.lean — 特別とん譲与税法施行規則 第二条（二以上の開港所在市町村）

独立レビュー（独立再抽出／一次資料）。impl ヘッダ・コメントは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**（H=反証可能仮説, T=再現検査と実出力, D=合否, C=対立解釈, U=不確かさ／留保）。技術的対応の検証であり人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA-256／法身份

- **H（** impl ヘッダの sha は二次情報。raw バイトから独立再計算し INVENTORY と照合する。
- **T（** `python audit_two_or_more.py` → `raw bytes: 6395` / `sha: 2ce4744265b50bdb5b62c0380575ca4b73fc7c92ee7f5125b97f74a90b384c7c` / `inventory sha: 2CE4744265B50…C7C`（大小文字違いのみ一致）/ `rev: 332M50000002021_20010106_412M50000008044` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA-256・施行版・施行状態が一次資料と一致。
- **C（** 一次資料 `data/raw/332M50000002021_20010106_412M50000008044.law.json`。代替解釈なし。確度: 高。
- **U（** 2026-11-15 固定スナップショットのみ。他施行版は対象外。

#### CHECK 2 — 逐語 needle／出所位置

- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。ヘッダ path は使わない。
- **T（** `needle whole-law count: 1` / `scoped chars: 364` / `needle in scoped: True`。srcpath は `Article:2/Article#2/ArticleCaption`（MAIN provision、附則ではない）。
- **D（** **PASS**。全局一致 1、第二条 scoped 内に存在。見出し（ArticleCaption）であることを含め出所位置は整合。
- **C（** 同文は附則・他条に重複しない（全局 1）。確度: 高。
- **U（** 見出しは規範本文ではなく条件の要約である。モデル化範囲を CHECK 4 で明示的に留保する。

#### CHECK 3 — 禁止トークン・独立 spec・境界

- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか（循環）、有限検査を普遍証明と誤っていないかを機械的に検査する。
- **T（** `impl/spec/tests forbidden: [] [] []` / `examples: 0 / 0 / 12` / `independent_spec_ok: True` / `spec literals: [2]` / `boundary categories: [saturation, small_input, threshold_above, threshold_at, threshold_below, zero]` / `clause correspondence: (True, 'spec numerals / rate ratio in clause')`。
- **D（** **PASS**。禁止トークン 0、spec は独自定数 `specMinimumPorts = 2` と補集合否定 `¬ ports < 2` を用い impl 名を参照しない。spec literal 2（二）は原文逐語に存在。境界 6 類 ≥ 3、example 12 ≥ 5。普遍一致定理 `agree_at_least_two (ports : Nat)` は全 Nat を対象とする。
- **C（** 漢字「二」= 2 は `kanji_variants(2)` で双方向照合済み。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** ローカルに Lean 未インストールのためカーネル再現は CI の scoped attestation に依存する。

#### CHECK 4 — 真の欠陥探索（誤値・過剰包含・off-by-one）

- **H（** 「二以上」を `2 <= ports` としたことの off-by-one、乙（1 件）の誤包含、譲与額算定の誤包含を意図的に探す。
- **T（** `example : atLeastTwo 1 = false` / `example : atLeastTwo 2 = true` / `example : atLeastTwo 3 = true`（Tests）。`specMinimumPorts = 2` は原文「二」と一致。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。1 件は false、2 件は true（以上は包含的）、3 件は true。境界は正しい。
- **C（** 見出し条件のみをモデル化し、譲与の基準そのもの・課税主体・税関区域の定義は明示的に対象外。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: この見出しに対応する本文（譲与の基準の具体的内容）は別ユニットとして未検証。本ユニットは条件「二以上」のみを検証する。

### Verdict

**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、原文数値対応、境界 6 類・example 12、普遍定理すべて PASS。F-1 はスコープ留保（本文の別ユニット必要）であり転記誤りではない。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
