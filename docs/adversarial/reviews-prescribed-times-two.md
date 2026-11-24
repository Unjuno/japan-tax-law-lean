### PrescribedTimesTwo.lean — 沖縄復帰特例省令 art.26（二回）

独立レビュー（独立再抽出／独立抽出）。著者コメントは信頼せず、raw JSON・INVENTORY・ジェネレータ補助関数・Lean 源文件から再導出した。表記は **H/T/D/C/U** 形式（H=仮説／独立再抽出, T=検査コマンドと実出力, D=判定 PASS/FAIL（具体値付き）, C=照合／確度, U=未解決・留保）。対象は uncommitted 新規 3 ファイル＋pin＋3 import だが、レビュー中に内容は再読して不変を確認。以下すべての照合は一次資料に基づく。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- **H（** impl ヘッダの `sha256: a403b5c2…af667` は二次情報。raw バイトから独立再計算し、impl ヘッダ・INVENTORY の両方と照合する。
- **T（** `python ptt_analyze1.py`
  - 実出力: `raw bytes on disk: 156649` / `CRLF count: 0` / `bare LF count: 0`
  - `sha256(normalized CRLF->LF): a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667`
  - `sha256(raw bytes as-is): a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667`
  - `impl header sha: a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667` / `normalized MATCH header: True` / `raw MATCH header: True`
- **D（** **PASS**。bytes = **156649**、SHA-256 = **a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667**。改行なし 1 行 JSON のため CRLF→LF は恒等で、正規化前後一致。
- **C（** 照合先: `data/INVENTORY.json` → `/laws[law_id=347M50000040042]/raw_snapshot.source_sha256 = A403B5C2…AAF667`（大小文字違いのみ一致）、`size_bytes = 156649`（一致）。確度: 高。
- **U（** 改行が存在しないため「CRLF→LF 正規化」の効果自体は検証不能だが両形式で同一であり報告値に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- **H（** needle を Unicode エスケープで独立構成し（cmd コードページ汚染を避ける）、JSON を再帰 walk して部分文字列／完全一致の両方で数える。ヘッダの path は使わない。
- **T（** `python ptt_analyze1.py` / `python ptt_analyze2.py`
  - `needle == escape-built: True` / `needle: 令第八十七条第四項に規定する財務省令で定める回数は、二回とする。`
  - `substring occurrences WHOLE law: 1` / `exact leaf occurrences WHOLE law: 1`
  - `EXACT PATH: /law_full_text/children/[1]/children/[3]/children/[0]/children/[4]/children/[11]/children/[2]/children/[1]/children/[0]/children/[0]`
  - `LEAF: 令第八十七条第四項に規定する財務省令で定める回数は、二回とする。`
  - `revision_info/law_title = '沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令'` / `law_info/law_id = '347M50000040042'` / `law_revision_id = '347M50000040042_20251231_507M60000040072'` / `current_revision_status = 'CurrentEnforced'`
  - INVENTORY: `current_revision` の `law_title` / `law_revision_id` / `current_revision_status='CurrentEnforced'` / `amendment_enforcement_date='2025-12-31'` が一致。
- **D（** **PASS**。全局一致回数 = **1**（部分文字列 1、完全一致 leaf 1）。法 id・题名・リビジョン・施行状態は raw `revision_info` と INVENTORY の独立 2 来源で一致。施行日 2025-12-31 は今日 2026-11-24 と整合。
- **C（** needle 完全一致 leaf、INVENTORY `current_revision`、`law_info` の 3 来源で照合。確度: 高。
- **U（** なし。

#### CHECK 3 — 出所位置（第二十六条・第一項・MAIN）

- **H（** needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplProvision）配下でないことを確認する。
- **T（** `python ptt_analyze2.py` / `python ptt_analyze4.py`
  - チェーン: `law_full_text` → `children[1] LawBody` → `children[3] MainProvision` → `children[0] Chapter(Num=1)` → `children[4] Section(Num=4)` → `children[11] Article(attr.Num=26)` → `children[2] Paragraph(attr.Num=1)` → `children[1] ParagraphSentence` → `children[0] Sentence(Num=1, WritingMode=vertical)` → leaf。
  - `Article Num=26 count in law: 1` / ArticleTitle = `第二十六条` / ArticleCaption = `（差額課税の対象となる酒類を継続的に船舶又は航空機に積み込む者の範囲等）`
  - `LawBody.child[3] = MainProvision`、`LawBody.child[4..39] = SupplProvision` という別系統であり、needle は MainProvision 側。
- **D（** **PASS**。記事 = **attr.Num "26"（第二十六条、全局で一意）**、段落 = **attr.Num "1"（第一項）**、祖先は **MainProvision** 配下で **SupplProvision（附則）祖先なし**。impl ヘッダの「第二十六条 (1) / MAIN」は実体と整合。誤記・off-by-one なし。
- **C（** raw の祖先チェーンと ArticleTitle／Caption で照合。確度: 高。
- **U（** impl ヘッダの `Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:26/…` は `Chapter(Num=1)` と `Section(Num=4)` のラッパーを省略した簡略表記で、独立 walk の 0-based path と直接対応しない。**記述上の曖昧さのみで実体（第二十六条・第一項・MAIN）は一致**、非ブロッキング（F-1 参照）。

#### CHECK 4 — 漢字「二」= 2 と spec literal の監査可能性・durable pin

- **H（** 暗黙の常識ではなく、公式ジェネレータの `int_to_kanji` / `_kanji_int` を実行して双方向で確認し、spec の literal と pin のロードを機械的に検査する。
- **T（** `python ptt_analyze2.py`（`sys.path` に `scripts/ci` を追加し `import generate_verification_evidence as gve`）
  - `int_to_kanji(2) = '二'` / `_kanji_int('二') = 2` / `kanji_variants(2) = {'二'}`
  - `needle contains 二回: True` / `needle contains kanji(2)+回: True`
  - spec: `def specTimes : Nat := [Nat.succ 0, Nat.succ 0].length`、`example : specTimes = 2 := by decide`
  - `PrescribedTimesTwo in checks_by_module: True` / entry = `{"law_id": "347M50000040042", "article": "26", "needles": ["令第八十七条第四項に規定する財務省令で定める回数は、二回とする。"]}`
- **D（** **PASS**。二 ↔ 2 は双方向成立。spec の `example : specTimes = 2 := by decide` はソース上の literal で監査可能。durable pin `data/TRANSCRIPTION_PINS/PrescribedTimesTwo.json` は `checks_by_module()` により法 id / article `26` / needle とともに実際にロードされている。
- **C（** needle leaf、INVENTORY 題名、ジェネレータ補助関数、pin ロード結果の 4 来源で照合。確度: 高。
- **U（** NORM id `NORM|23f9f0b9…da3a25` は 2 つの Lean ヘッダと `docs/UNIT_PRESCRIBED_TIMES_TWO.md` にのみ存在し、`data/verification_evidence.json` 等には未掲載（grep 3 命中）。パイプライン登録予定の確認を推奨するがブロッキングではない（F-2 参照）。

#### CHECK 5 — Lean 三ファイルの構造（Circular / 普遍定理 / example / 禁止トークン）

- **H（** 三ファイルを実読し、(1) spec* defs が impl 名を再利用していないか、(2) 有限サンプリングではなく全 Nat に対する kernel チェック一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 カテゴリか、(4) `sorry`/`admit`/`axiom`/`Classical.choice` が実行コードに無いか、を機械的に検査する。
- **T（** `read` 三ファイル + `python ptt_analyze2.py`
  - 禁止トークン（`strip_comments` 後）: impl/spec/tests すべて `{'sorry':0,'admit':0,'axiom':0,'Classical.choice':0}`。impl の生テキストでは各 1 命中するが、いずれも doc コメント末尾の `No \`sorry\`, \`admit\`, \`axiom\` or \`Classical.choice\`.` という文字列であり実行コードには 0。
  - 宣言数: impl `example=0, theorem=3` / spec `example=2, theorem=1` / tests `example=11, theorem=0`（合計 example **13** ≥ 5）。
  - spec* defs が impl 名（`prescribedTimes` / `isPrescribedCount`）を参照: `[]` → 循環なし。
  - ブリッジ定理: `agree_prescribed_count (n : Nat) : isPrescribedCount n = specIsPrescribedCount n`（`by_cases h : n = 2` + `omega` + `simp`、全 Nat を網羅する**普遍**定理）。
  - `boundary_evidence_categories(tests, literals=[2])` = `{'zero','small_input','saturation','threshold_below','threshold_at','threshold_above'}`（6 カテゴリ ≥ 3）。
- **D（** **PASS**。(1) spec* defs（`specTimes` / `specIsPrescribedCount` / `specTimesGrid`）は impl 名を一切参照せず、後継子形式の比較 `Nat.succ (Nat.succ 0) == n` という別定式化を用いる。(2) 一致定理は有限グリッドではなく **全 Nat 全称**で kernel が各 n を検証する。(3) example 13（≥5）、境界カテゴリ 6（≥3）。(4) 実行コードの禁止トークン 0。**「回数は二回」意味論**: `2=true, 0/1/3=false` は main 文に合致（下方的にも上方的にも厳密）。
- **C（** 構造・テキストは高確度で照合済み。本レビューは単一書き込み制約を遵守するため `lake build` は未実行（`omega` は `TaxFinance` の `import Std` 経由と推測）。カーネル検証の「実行」自体は未再現、確度: 中（構造は高）。
- **U（** F-3 参照。

#### CHECK 6 — 真の欠陥探索（誤値・誤ラベル・弱 spec・off-by-one）

- **H（** count 値、law/article/revision/sha の誤表示、循環的・弱い spec、off-by-one を意図的に探す。Article 26 の全文（¶1 と ¶2）を読み、競合する回数規範が無いか再考する。
- **T（** `python ptt_analyze3.py` / `python ptt_analyze4.py` + CHECK 1–5 の全出力
  - Article 26 全文: ¶1 `令第八十七条第四項に規定する財務省令で定める回数は、二回とする。` / ¶2 `…令第八十七条第四項に規定する申告書の提出回数を…月数で除し、これに六を乗じて得た数が十二以上となる者とする。`
  - 全局の `回数` 含有文字列は 2 件のみ（上記 ¶1 needle と ¶2 の `十二以上` 条件）。needle 自体は 1 件一意。
- **D（** **PASS（転記・身份・sha・spec に関しブロッキング欠陥なし）**。count = 2 は ¶1 の「二回」と正しく対応。¶2 の `十二以上` は別の適格要件（提出回数の割合）であり、¶1 が固定する「財務省令で定める回数」とは異なる規範。よって `prescribedTimes = 2` の誤値ではない。law id・第二十六条・第一項・リビジョン・SHA の誤表示なし、off-by-one なし。非ブロッキングの F-1〜F-3 を記録する。
- **C（** raw JSON・INVENTORY・ジェネレータ補助関数・源文件の独立 4 来源で照合。確度: 高。
- **U（** 法的判断（¶1 と ¶2 の関係を含む）は人間に留保（LEGAL_REVIEW_PENDING）。

---

#### F-1（ヘッダ Source path の簡略表記 — 非ブロッキング・ドキュメント級）

- **H（** impl ヘッダの `Source path` が実 JSON の祖先チェーンと食い違い、誤った出所表示ではないか、という仮説。
- **T（** CHECK 3 の実出力: 実チェーンは `MainProvision → Chapter(Num=1) → Section(Num=4) → Article(Num=26)`。ヘッダは `LawBody[3]/MainProvision/MainProvision[0]/Article:26/Article#26/Paragraph#1/…` と表記し、Chapter/Section を省略。needle の実 leaf と記事・段落は一致。
- **D（** **判定: 実在する表記の曖昧さ（コード／転記ミスではない）**。1-based／0-based と階層省略が混在する記述上の問題であり、第二十六条・第一項・MAIN という実体は正しい。ブロッキング欠陥ではない。
- **C（** raw 祖先チェーンとヘッダを照合。確度: 高（事実関係は再現済み）。
- **U（** 修正提案: ヘッダの `Source path` を 0-based JSON path（`law_full_text/children[1]/children[3]/children[0]/children[4]/children[11]/…`）に合わせるか、`Chapter(Num=1)/Section(Num=4)` を明示すること。

#### F-2（NORM id のエビデンス未登録 — 非ブロッキング・パイプライン級）

- **H（** 主張された Normative unit id が生成エビデンスに登録されていないため、下流のトレーサビリティが切れていないか、という仮説。
- **T（** grep `23f9f0b9…da3a25` → 3 命中（`docs/UNIT_PRESCRIBED_TIMES_TWO.md`、`PrescribedTimesTwo.lean`、`PrescribedTimesTwoSpec.lean`）。`data/verification_evidence.json` / `EVIDENCE_GENERATION_AUDIT.json` には 0 命中。
- **D（** **判定: 事実（未登録）**。転記・意味論の誤りではない。同種の留保が既存レビュー（CommitteeTermTwoYears 等）にも見られ、登録はレビュー後工程と思料。
- **C（** repo 全体 grep で照合。確度: 高。
- **U（** 生成パイプライン管理者に当該 NORM id の `verification_evidence.json` 登録予定を確認すること。

#### F-3（spec 内ローカル定数の負荷状況／unit doc の記述差 — 非ブロッキング・ドキュメント級）

- **H（** spec の「独立定数」が実際には述語に使われておらず、独立性が見かけだけではないか、また unit doc の記述が実ファイルと食い違わないか、という仮説。
- **T（** `specIsPrescribedCount n := decide (Nat.succ (Nat.succ 0) == n)` は `specTimes` を参照しない。`specTimesGrid` も `decide (2 <= n && n <= 2)` を用い `specTimes` を参照しない。`specTimes` は `example : specTimes = 2` のみで使用。unit doc は「Tests: 10 kernel-decided examples / boundary categories {zero, small_input, saturation}」と記載するが、実 Tests は 11 個の `example`、generator の検出カテゴリは 6 類。
- **D（** **判定: 事実だが非ブロッキング**。kernel が検証する普遍定理 `agree_prescribed_count` は `decide (2 == n)` と `decide (succ (succ 0) == n)` を全 Nat で一致させ、健全である。specTimes が述語に使われていないことは「定数 2 の別導出」が負荷を持たないだけで、値 2 自体は `example : specTimes = 2 := by decide` で監査可能。unit doc の 10→11 は documentation 上の数字ズレ。
- **C（** spec/tests 源文件と `unit doc`、`boundary_evidence_categories` 出力を照合。確度: 高。
- **U（** 修正提案: (a) `specIsPrescribedCount` を `decide (specTimes == n)` としてローカル定数を負荷を持たせる（その場合も普遍定理は `omega` で閉じるか、補助 lemma を追加）、(b) unit doc を「11 examples / 6 boundary categories」に更新。いずれも truth value は変更しない。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった。** raw SHA-256（156649 bytes / `a403b5c2…af667`）、needle 全局一意性（1 件）、法身份（沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する省令 / 第二十六条 / 第一項 / MAIN / CurrentEnforced）、漢字二=2、pin の `checks_by_module()` ロード、spec の独立性と全 Nat 普遍一致定理、example 13 件と 6 境界カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で **PASS**。F-1（ヘッダ path の簡略表記）、F-2（NORM id 未登録）、F-3（specTimes の非負荷／unit doc の数字差）はいずれもドキュメント／パイプライン級の留保であり、転記・特定情報・「回数 = 2」の中核意味論の誤りではない。

**法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** 本レビューはソース対応・構造・符号化の经验的検証に限られ、¶1 と ¶2 の関係を含む法的取扱い、および `lake build` によるカーネル再検証はレビュー担当者の判断・実行に委ねる。
