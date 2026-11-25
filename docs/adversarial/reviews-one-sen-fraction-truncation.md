### OneSenFractionTruncation.lean — たばこ税法施行規則 第四条第二項（一銭未満端数控除）

独立レビュー（独立再抽出／一次資料）。impl ヘッダは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。**H/T/D/C/U**（H=反証可能仮説, T=再現検査と実出力, D=合否, C=対立解釈, U=不確かさ／留保）。人間の法的判断を代行しない（LEGAL_REVIEW_PENDING）。

#### CHECK 1 — raw SHA／法身份
- **H（** impl ヘッダの sha は二次情報。raw バイトから独立再計算し INVENTORY と照合。
- **T（** `python audit7.py` → `raw bytes: 15118` / `sha: 4f4af1cb9f0b4ebb9799cc8438921bf7ef1fcfe8c0038043990e0e2be27237e5` / `inv sha: 4F4AF1CB…37E5`（大小文字違いのみ）/ `rev: 360M50000040001_20240401_506M60000040021` / `status: CurrentEnforced`。
- **D（** **PASS**。byte 数・SHA・施行版・施行状態が一次資料と一致。
- **C（** 一次資料 `data/raw/360M50000040001_20240401_506M60000040021.law.json`。確度: 高。
- **U（** 2026-11-15 固定スナップショットのみ。

#### CHECK 2 — 逐語 needle／出所
- **H（** needle を独立構成し JSON を再帰 walk して全局一致を数える。
- **T（** `needle whole law: 1` / `scoped chars: 393` / `in scoped: True` / srcpath `Article#4/Paragraph#2/ParagraphSentence/Sentence#1`（MAIN）。
- **D（** **PASS**。全局 1、第四条第二項 scoped 内に存在。附則ではない。
- **C（** 同一文は他条・附則に重複しない。確度: 高。
- **U（** なし。

#### CHECK 3 — 禁止トークン／独立 spec／境界
- **H（** 実行コードに禁止トークンが無いか、spec* defs が impl 定義を再利用していないか、有限検査を普遍証明と誤っていないか。
- **T（** `impl/spec/tests forbidden: [] [] []` / `examples: 0/0/10` / `independent: True` / `spec literals: []` / `boundary: [zero, small_input, saturation]` / `clause: (True, pinned needle in clause)`。
- **D（** **PASS**。禁止トークン 0、独立 spec は `match f with | true => sen | false => sen`（impl の投射と異なる演算子、impl 名非参照）。spec に数値 literal が無いため原文対応は逐語 needle で anchor。境界 3 類 ≥ 3、example 10 ≥ 5。普遍定理 `agree_floor_to_sen (sen : Nat) (f : Bool)` は全入力を対象。
- **C（** 「一銭」は単位であり原文中の金額 literal ではない。確度: 高（構造）、カーネル実行は CI 待ちで中。
- **U（** Lean ローカル未インストールのためカーネル再現は CI attestation に依存。

#### CHECK 4 — 真の欠陥探索
- **H（** 端数切捨てを誤って加算・繰上げとしている、whole-銭を変更している、前項の計算を誤包含していないか。
- **T（** `floorToSen 0 true = 0` / `floorToSen 1 true = 1` / `floorToSen 3 false = 3`（Tests）。
- **D（** **PASS（転記・符号化にブロッキング欠陥なし）**。端数がある場合もない場合も whole-銭は不変。前項の計算は Scope で明示的に除外。
- **C（** 金額表現を (whole 銭, 端数フラグ) に抽象化しており、銭未満のより細かい単位はモデル化しない。確度: 中（法的意味は人間のレビュー事項）。
- **U（** **F-1（非ブロッキング）**: 前項の金額算定本体は別ユニットとして未検証。

### Verdict
**ブロッキング欠陥なし。** raw SHA、needle 一意性、法身份、禁止トークン 0、独立 spec、needle anchor、境界 3 類・example 10、普遍定理すべて PASS。F-1 はスコープ留保。**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。**
