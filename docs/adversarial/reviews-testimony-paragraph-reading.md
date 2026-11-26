### TestimonyParagraphReading.lean — 緊急関税等政令 第四条第九項（証言への準用範囲）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit13.py` → `raw bytes: 35430` / `sha: e58c5ee4bf320859ac79716cdd9eb520a5ca073ee6153a0b2f6d15a92ab2bf67` / `inv sha: E58C5EE4…BF67`（大小文字違いのみ）/ `rev: 406CO0000000417_20090401_421CO0000000110` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。確度: 高。
- **C（** 一次資料 `data/raw/406CO0000000417_20090401_421CO0000000110.law.json`。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 1584` / `in scoped: True` / srcpath `Article:4/Paragraph#9/ParagraphSentence/Sentence`（MAIN provision）。
- **D（** **PASS**。全局 1、第四条 scoped 内に存在。附則ではない。確度: 高。
- **C（** 同文は他条・附則に重複しない。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: [2]` / `boundary: [zero, small_input, threshold_below, threshold_at, threshold_above, saturation]` / `clause: (True, spec numerals / rate ratio in clause)`。
- **D（** **PASS**。禁止トークン 0。独立 spec は命題的等号 OR（`decide (p = 1 ∨ p = 2)`）で impl の構造的パターンマッチと異なる演算子、impl 名非参照。spec literal 2（二）は原文「第二項」に逐語存在。境界 6 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_applies_to_testimony` は入れ子 `cases` + `decide`/`rfl` のみで公理を導入しない。
- **C（** 漢字「二」=2 は `kanji_variants` で双方向照合済み。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 証言の準用対象を誤って選択していないか、第四項から前項までの範囲を誤包含していないか。
- **T（** `appliesToTestimony 1 = true` / `appliesToTestimony 2 = true` / `appliesToTestimony 3 = false`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。1 と 2 のみ選択、0 と 3 以上は false。off-by-one なし。準用される規定の実質は Scope で明示的に除外。
- **C（** 数値は条項ラベルであり法令上の金額ではない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 第四項から前項までの規定の実質内容は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、原文数値対応、境界 6 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
