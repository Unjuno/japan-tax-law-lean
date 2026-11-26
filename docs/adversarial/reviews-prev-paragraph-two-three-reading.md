### PrevParagraphTwoThreeReading.lean — 米軍地位協定臨時特例法施行令 第三条の二第二項（前条二・三項準用）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**（H=反証可能仮説, T=再現検査と実出力, D=合否, C=対立解釈, U=不確かさ／留保）。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** impl ヘッダの sha は二次情報。raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit8.py` → `raw bytes: 28347` / `sha: d223acc4d7e839ca560c81508af1b1b888e0d7e7e1f58303a86a17e6ce17e2ea` / `inv sha: D223ACC4…E2EA`（大小文字違いのみ）/ `rev: 327CO0000000124_20220401_502CO0000000207` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。
- **C（** 一次資料 `data/raw/327CO0000000124_20220401_502CO0000000207.law.json`。確度: 高。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 212` / `in scoped: True` / srcpath `Article:3_2/Paragraph#2/ParagraphSentence/Sentence#1`（MAIN provision）。
- **D（** **PASS**。全局 1、第三条の二 scoped 内に存在。附則ではない。
- **C（** 同文は他条・附則に重複しない。確度: 高。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と誤っていないか。
- **T（** `impl/spec/tests forbidden: [] [] []` / `examples: 0/0/14` / `independent: True` / `spec literals: [2,3]` / `boundary: [zero, small_input, threshold_below, threshold_at, threshold_above, saturation]` / `clause: (True, spec numerals / rate ratio in clause)`。
- **D（** **PASS**。禁止トークン 0、独立 spec は二つの否定厳格順序による文字列表現（`¬ p < 2 ∧ ¬ 2 < p` 等）で impl の等号 OR と異なる演算子、impl 名非参照。spec literal 2（二）・3（三）は原文に逐語存在。境界 6 類 ≥ 3、example 14 ≥ 5。普遍定理 `agree_applies_to (paragraph : Nat)` は全 Nat を対象。
- **C（** 漢字「二」=2・「三」=3 は `kanji_variants` で双方向照合済み。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索（誤解決・off-by-one）
- **H（** 第二項・第三項を誤って含む／除く、前条以外の条を混同、課税石油ガスの定義や税額計算を誤包含していないか。
- **T（** `appliesTo 1 = false` / `appliesTo 2 = true` / `appliesTo 3 = true` / `appliesTo 4 = false`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。1 と 4 は false、2 と 3 は true（「及び」は包含的列挙）。off-by-one なし。前条・課税石油ガスの実体は Scope で明示的に除外。
- **C（** 条項ラベルを Nat で表現しており、条文内容そのものはモデル化しない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 準用される前条第二項・第三項の実質内容は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、原文数値対応、境界 6 類・example 14、普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
