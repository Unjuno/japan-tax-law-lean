### BankHeadOfficeTermReading.lean — 電子情報処理組織特例省令 第十一条第四項（日本銀行統轄店の読替え）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** impl ヘッダの sha は二次情報。raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit10.py` → `raw bytes: 92139` / `sha: d975b5d18cdd9dd0f21fbb598e8704186e1cff3779ed1b9cacfd04df5c42fe41` / `inv sha: D975B5D1…42FE41`（大小文字違いのみ）/ `rev: 403M50000040054_20260924_508M60000040059` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。確度: 高。
- **C（** 一次資料 `data/raw/403M50000040054_20260924_508M60000040059.law.json`。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 800` / `in scoped: True` / srcpath `Article:11/Paragraph#4/ParagraphSentence/Sentence#2`（MAIN provision）。
- **D（** **PASS**。全局 1、第十一条 scoped 内に存在。附則ではない。確度: 高。
- **C（** 同文は他条・附則に重複しない。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と混同していないか。
- **T（** `impl/spec/tests forbidden: [] [] []`（omega も 0）/ `examples: 0/0/9` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0。独立 spec は命題的等号判定（`if c = 0 then 1 else c`）で impl の構造的パターンマッチと異なる演算子、impl 名非参照。原文に金額 literal が無いため needle を anchor。境界 3 類 ≥ 3、example 9 ≥ 5。普遍定理 `agree_read_as (c : Nat)` は `cases c <;> rfl` のみで公理を導入しない。
- **C（** 前回の `Classical.choice` 失敗を踏まえ意図的に構造的証明を選択。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 読替えの向きを逆にしていないか、他区分を上書きしていないか、第六項の実質を誤包含していないか。
- **T（** `readAs 0 = 1` / `readAs 1 = 1` / `readAs 2 = 2`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。0（日本銀行統轄店）→1（所轄歳入取りまとめ店）、1 と 2 は不変。off-by-one なし。第六項の実質は Scope で明示的に除外。
- **C（** 数値は用語タグであり法令上の金額ではない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 「この場合」の触发条件と第六項の実質内容は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 9、公理フリー普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
