# Adversarial Review — QuakeReconstructionExpenseFloor1M（独立機械クロスチェック）

レビュー日: 2026-11-22 / 独立レビューエージェント。**機械的独立照合であり人間の法解釈レビューではない**。
impl / spec header のコメントと `transcription_audit.py` は信用せず、使い捨て自前 Python
（`D:\CodexData\Temp\opencode\jtl_audit_quake{,2,3,4,5}.py`, `jtl_norm_check.py`, `jtl_kanji_check.py`）
で pinned 生 JSON を直接読み、**独立再抽出**・SHA 再計算・`attr.Num` 定位・原文 leaf 抽出・
NORM id 再計算を実施。本環境に lake/lean なし（`lean-toolchain` = `leanprover/lean4:v4.35.0`
だが実行ファイル不在）、カーネル再実行は未実施。`H/T/D/C/U` を checks ごとに付す。

---

### QuakeReconstructionExpenseFloor1M.lean — 東日本大震災特例法 art.38-2(2)(4)イ（百万円以上）

**対象**: impl `QuakeReconstructionExpenseFloor1M.lean` / spec `…Spec.lean` / tests `…Tests.lean`。
**主張**: 原文「当該工事に要した費用の額が百万円以上であること。」= 工事費用 ≥ ¥1,000,000
（以上 inclusive）、法 423AC0000000029 / revision `423AC0000000029_20260401_508AC0000000012` /
norm unit `NORM|894f40b7793d3fa713c8a984bee8ac458702a9b16af5b9a67796ad467c38c776`。

#### Check 1 — 生スナップショット SHA-256 / バイト数（header との照合）

- **H（反証可能な仮説）**: impl header line 13 の sha256 `87125cf7…c3f` が実ファイルと一致する。不一致なら反証。
- **T（実際のコマンド/出力）**:
  ```
  python (hashlib): p.read_bytes() → len=1119036, count(\r\n)=0, count(\n)=0
    SHA_RAW  = 87125cf7c2562c5be34270498efc007cfd80abbec74aa372a9ffac93bec74c3f
    SHA_LF   = 87125cf7c2562c5be34270498efc007cfd80abbec74aa372a9ffac93bec74c3f
  ```
  ファイルは改行無しの単一行 JSON のため CRLF→LF 正規化は no-op（FV: LF=0）。
- **D（判定）**: **PASS** — bytes=**1,119,036**、sha256=**87125cf7c2562c5be34270498efc007cfd80abbec74aa372a9ffac93bec74c3f**、impl header line 13 および `INVENTORY.json` の `raw_snapshot.source_sha256 = 87125CF7…C3F` / `size_bytes = 1119036` と完全一致。
- **C（競合解釈）**: 改行正規化の別バリエーションを採ってもハッシュは不変（改行 0 個）。
- **U（不確実性）**: ハッシュ一致は「转录忠实」のみを保証し、意味・法解釈を保証しない。

#### Check 2 — ニードル一意性・法題名・revision 状態

- **H（仮説）**: ニードルは当該法内で 1 回のみ出现し、revision_info の law_title / current_revision_status が INVENTORY と一致する。
- **T（コマンド/出力）**: 自前 JSON walk で全文字列 leaf を走査:
  ```
  NEEDLE_COUNT_LAW 1
  HIT_COUNT_LEAVES 1
  revision_info.law_title = 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律
  revision_info.law_revision_id = 423AC0000000029_20260401_508AC0000000012
  revision_info.current_revision_status = CurrentEnforced
  INVENTORY official_title = 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律
  INVENTORY current_revision.law_revision_id = 423AC0000000029_20260401_508AC0000000012
  INVENTORY current_revision_status = CurrentEnforced
  ```
- **D（判定）**: **PASS** — 当該法内のニードル出现 = **1**（verbatim-unique）、law_title 一致、revision id 一致、status = **CurrentEnforced**。
- **C（競合解釈）**: 同一ニードルは他法（租税特別措置法 332AC0000000026）にも存在するが、本检查は `423AC…` スナップショットのみを読むため混入しない（Check 6 で別途確認）。
- **U（不確実性）**: `revision_info.updated = 2026-04-14…` と INVENTORY `current_revision.updated = 2026-10-09…` はメタデータ更新時刻の差であり、revision id / status の同一性に影響しない。

#### Check 3 — 原文の所在地（条・項・号・イ・本則）

- **H（仮説）**: ニードルは `attr.Num="38_2"` の Article、Paragraph Num=2、Item Num=4、Subitem1 Num=1、本則（MainProvision）にあり、附則ではない。
- **T（独立再抽出の経路）**: 自前 walk の祖先連鎖（root→leaf）:
  ```
  law_full_text → Law
   children#1 → LawBody
   children#2 → MainProvision        ← 本則（SupplProvision なし）
   children#3 → Chapter
   children#6 → Article   attr.Num="38_2"
   children#3 → Paragraph attr.Num="2"
   children#5 → Item      attr.Num="4"
   children#2 → Subitem1  attr.Num="1"
   children#1 → Subitem1Sentence → children#0 Sentence → children#0 文字列 leaf
  ArticleTitle = 第三十八条の二
  ArticleCaption = （東日本大震災の被災者が直系尊属から住宅取得等資金の贈与を受けた場合の贈与税の非課税）
  ```
  パイプライン（`task_queue.iter_articles`）のパスも `('LawBody[2]', 'MainProvision', 'MainProvision[3]', 'Article:38_2')` で header 表記と一致。
- **D（判定）**: **PASS** — Article=**38_2** / Paragraph=**2** / Item=**4** / Subitem1=**1**、経路上に `SupplProvision`（附則）なし、ArticleTitle=**第三十八条の二**。header の `Article#38_2` はパイプライン表記上の冗長_segment だが、定位自体は正しい。
- **C（競合解釈）**: 同法他条（例: 第三十八条）や附則に同一文言があれば反証となるが、経路は `Article:38_2` 一意。
- **U（不確実性）**: 分解パイプラインの unit `subitem` フィールドは `''`（文 leaf には subitem 番号が伝播しない実装）だが、生ツリー上の Subitem1 Num=1 は直接確認済みで、NORM id 再計算（Check 6）も一致するため影響なし。gated 税制（住宅取得等資金の贈与税非課税）の実体は非モデル化。

#### Check 4 — 漢字「百万」= 1,000,000 の独立確認

- **H（仮説）**: `int_to_kanji(1_000_000) = 百万` かつ `_kanji_int("百万") = 1_000_000`。
- **T（コマンド/出力）**:
  ```
  python: import generate_verification_evidence as g
    g.int_to_kanji(1000000) = 百万
    g._kanji_int("百万")    = 1000000
    roundtrip               = 1000000
    g.int_to_kanji(999999)  = 九十九万九千九百九十九
  ```
- **D（判定）**: **PASS** — 百万 ⇔ **1,000,000**、spec の `specExpenseFloor : Nat := 1_000_000`（`rfl` で監査可能）および impl の `expenseFloor = 1_000_000` と一致。
- **C（競合解釈）**: 「百万」を 100 × 10,000 = 1,000,000 と誤読しても同値。1,000,000 未満（999,999）は「九十九万九千九百九十九」であり「百万」ではない。
- **U（不確実性）**: 漢字変換は Repo の自前関数に依存するが、ymmetry roundtrip が成立するのみで法令上の通用性を証明するものではない。

#### Check 5 — Lean 構造: 非巡回性・普遍定理・境界・禁止トークン

- **H（仮説）**: spec* defs が impl 名を再利用せず、impl/spec 対応が全 Nat に対する kernel-checked 定理であり、禁止トークンが無い。
- **T（grep / 読み取り）**:
  ```
  grep -E 'sorry|admit|axiom|Classical\.choice|unsafe' 三ファイル
    → impl: 1 件はコメント行 33「No `sorry`, `admit`, `axiom` or `Classical.choice`.」のみ（実コードなし）
    → spec/tests: 0 件
  spec: def specExpenseFloor := 1_000_000 / def specMeetsExpense a := decide (¬ a < specExpenseFloor)
        — impl 名 (expenseFloor / meetsExpenseFloor / <=) を spec* defs 内で一切使用せず、演算子も `<`
  spec: theorem agree_expense_floor (amount : Nat) : meetsExpenseFloor amount = specMeetsExpense amount
        — by_cases + omega、全称 Nat、有限サンプリングではない
  example 数: spec 1 + tests 11 = 12（『≥5』を満たす）
  境界カテゴリ: zero / small_input(1) / just_below(999,999) / at_floor(1,000,000) / above_floor(1,000,001) / saturation(1,000,000+0) — 3 類以上を満たす
  ```
- **D（判定）**: **PASS** — 禁止トークン実コード **0**、spec 独立定義、普遍定理 `agree_expense_floor`（全 Nat、`omega`）、`example` **12**、境界 **6** カテゴリ。impl の `meetsExpenseFloor 1_000_000 = true` / `999_999 = false` は `<=` の inclusive 意味と整合。
- **C（競合解釈）**: 「以上」を厳格 `>` と読むとちょうど 1,000,000 を誤って除外するが、`floor_inclusive` 定理（`meetsExpenseFloor 1_000_000 = true`）がこの読みを排斥する。`以下`/`未満`（上限・区切り）ではない——当該ニードルは下限のみ。near-miss の `IncomeRegPaymentCeiling1M`（以下）は別法・別 pin。
- **U（不確実性）**: 本環境に lake/lean が無く `by decide` / `by omega` のカーネル再実行は未実施。数式は初等的だが、厳密性は実行環境での再コンパイルを要する。

#### Check 6 — 他法との同一ニードル混入（conflation）と NORM id 再計算

- **H（仮説）**: pin が 423AC law/art.38_2 unit を正しく指し、332AC の同一ニードル (art.70_2, 70_3) と混同されない。NORM id が構造座標から再計算できる。
- **T（コマンド/出力）**:
  ```
  transcription_audit.py pin (line 2135-2138):
    law_id="423AC0000000029", kind="article", title="第三十八条の二", needle=[...百万円以上...]
  find_article_text(): INVENTORY → raw_snapshot.source_file で法を限定し、MainProvision 内の
                       ArticleTitle=="第三十八条の二" のみを haystack にする（他法混入不可）
  実 audit: python scripts/ci/transcription_audit.py → PASS 東日本大震災特例法 art.38-2(2)(4)イ…
            transcription audit: 257/257 checks passed
  全法ニードル数: 332AC0000000026 = 2（art.70_2 / 70_3）/ 423AC0000000029 = 1
  NORM id 再計算（task_queue.iter_articles + core.decompose_article）:
    ID  NORM|894f40b7793d3fa713c8a984bee8ac458702a9b16af5b9a67796ad467c38c776
    KIND CONDITION / COORDS (MAIN, 38_2, 2, 4, '', 0)
  ```
- **D（判定）**: **PASS** — pin は law_id `423AC0000000029` + Article `第三十八条の二` に厳密スコープ。再計算 NORM id は header/spec/docs の宣言値と **完全一致**。332AC の 2 件は別法スナップショットに留まり混入なし。
- **C（競合解釈）**: ニードル文字列だけを根拠に 332AC の unit を指せば混同し得るが、pin は (law_id, article_title, source_file) で束縛されているため反証されない。
- **U（不確実性）**: NORM id は Repo の `make_normative_id` に依存するが、独立再計算が一致したため宣言ラベルに留まらない。unit の `subitem` 座標が `''` になる実装都合は Check 3 で記述済み。

---

## Verdict（判定）

**具体的不具合（concrete defect）は検出されず。** 6 チェックすべて **PASS**:

| 检查 | D |
|---|---|
| 1 生 SHA / bytes | PASS（1,119,036 bytes / 87125cf7…c3f） |
| 2 ニードル一意 / revision | PASS（1 回 / CurrentEnforced / title 一致） |
| 3 所在地（38_2/2/4/イ・本則） | PASS（附則なし） |
| 4 百万 = 1,000,000 | PASS（roundtrip 成立） |
| 5 Lean 構造 | PASS（禁止 0 / 普遍定理 / 12 examples / 6 境界） |
| 6 混同防止 / NORM id | PASS（再計算 id 一致 / 257/257 audit） |

**以上 inclusive の意味**は `meetsExpenseFloor 1_000_000 = true` / `999_999 = false` で確認され、
1,000,000 の off-by-one は存在しない。impl と spec の橋渡しは全 Nat に対する kernel-checked 定理であり、
有限サンプリングや spec 側への impl 名再利用（巡回）は無い。

ただしこれは**转录忠实性・構造・計算スライスの機械的照合に限られ、法律上の正しさを保証するものではない**。
gated 税制（住宅取得等資金の贈与税の非課税）、「当該工事」「被災者等」の定義、他の項・号・イおよび
施行規則は非モデル化であり、**人間の法解釈レビューは未完了（LEGAL_REVIEW_PENDING）** とする。
加えて本環境では lake/lean が不在のためカーネル再実行は未実施で、そこは残存不確実性である。
