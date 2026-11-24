### PrescribedPeriodWithinFourMonths.lean — 不当廉売関税等政令 art.17（四月以内）

独立レビュー（**独立再抽出**／独立抽出）。著者コメント・ヘッダ・UNIT ドキュメントは信頼せず、raw バイト・raw JSON・INVENTORY・キュー分解・ジェネレータ補助関数・Lean 源文件から再導出した。表記は **H/T/D/C/U**（H=反証可能な仮説／独立再抽出, T=検査コマンドと実出力, D=判定, C=照合・確度, U=未解決・留保）。各 CHECK に H（／T（／D（／C（／U（ を明示する。対象 3 Lean ファイル＋durable pin＋3 import はレビュー中に変更していない（本レビューは指定された 1 ファイルのみ書き込む）。以下すべての**照合**は一次資料に基づく。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- **H（** impl ヘッダの `sha256: d974e780…21425` は二次情報。raw バイトから独立再計算し、impl ヘッダ・INVENTORY・キュー `source_sha256` の三者と照合する。
- **T（** `python review_checks.py` 実出力:
  - `raw bytes: 147316` / `CRLF count: 0` / `LF-normalized bytes: 147316`
  - `sha256 CRLF->LF: d974e780d80a9ce51dec77692539d954417b8382bed7af33a0ba949066e21425`
  - `header: d974e780d80a9ce51dec77692539d954417b8382bed7af33a0ba949066e21425` / `MATCH: True`
  - INVENTORY `raw_snapshot.source_sha256 = D974E780…21425`（大小文字違いのみ一致）、`size_bytes = 147316`（一致）。キュー task の `source_sha256` も同値。
- **D（** **PASS**。bytes = **147316**、SHA-256 = **d974e780d80a9ce51dec77692539d954417b8382bed7af33a0ba949066e21425**。改行なし 1 行 JSON のため CRLF→LF は恒等で、正規化前後一致。
- **C（** raw ファイル・impl ヘッダ・INVENTORY・キューの 4 来源で照合。確度: 高。
- **U（** 改行が存在しないため「CRLF→LF 正規化」の効果自体は検証不能だが報告値に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- **H（** needle を文字列として独立に保持し、ヘッダの path を使わず JSON を再帰 walk して部分文字列／リーフ完全一致の両方で数える。
- **T（** `python review_checks.py` 実出力:
  - `literal needle count in raw file text: 1` / `count in LF-normalized text: 1` / `strings containing needle: 1` / `total occurrences across flattened leaves: 1`
  - `HIT PATH: law_full_text/Law/LawBody/MainProvision/Article(Num=17)/Paragraph(Num=1)/ParagraphSentence/Sentence(Num=1)/children`
  - `HIT LEAF: 法第八条第九項に規定する政令で定める期間は、四月以内の期間とする。`
  - raw `revision_info`: `law_title = 不当廉売関税等に関する政令` / `law_revision_id = 406CO0000000416_20260401_508CO0000000085` / `current_revision_status = CurrentEnforced` / `law_type = CabinetOrder` / `amendment_enforcement_date = 2026-04-01`。
  - INVENTORY `current_revision`: 同じ revision id・題名・`CurrentEnforced`・施行日 2026-04-01（今日 2026-11-24 と整合）。
- **D（** **PASS**。全局一致回数 = **1**（部分文字列 1、完全一致 leaf 1）。「verbatim-unique in whole law」主張は成立。法 id・題名・リビジョン・施行状態は raw と INVENTORY の独立 2 来源で一致。
- **C（** raw JSON・INVENTORY・キュー task の 3 来源で照合。確度: 高。
- **U（** NORM id `NORM|037bb6e3…5db1cdb` は UNIT doc と impl/spec ヘッダの 3 箇所にのみ存在し、`data/verification_evidence.json` / `data/EVIDENCE_GENERATION_AUDIT.json` には未掲載（F-2 参照、非ブロッキング）。

#### CHECK 3 — 出所位置（第十七条・第一項・MAIN provision、附則でない）

- **H（** needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplProvision）配下でないことを確認する。あわせて同条文の周辺文（ただし書）を読む。
- **T（** `python review_checks.py` / `python review_checks4.py` 実出力:
  - チェーン: `law_full_text` → `Law` → `LawBody` → `MainProvision` → `Article(attr.Num=17)` → `Paragraph(attr.Num=1)` → `ParagraphSentence` → `Sentence(Num=1, Function=main)` → leaf。
  - `enclosing Article tag path: law_full_text/Law/LawBody/MainProvision/Article Num=17 in_supplementary=False`。ArticleTitle = `第十七条`、Caption = `（暫定措置の期間）`。
  - キュー source_path = `LawBody[2]/MainProvision/MainProvision[23]/Article:17/Article#17/Paragraph#1/ParagraphSentence/Sentence#1`（impl ヘッダと完全一致）。
- **D（** **PASS**。記事 = **attr.Num "17"（第十七条）**、段落 = **attr.Num "1"（第一項）**、祖先は **MainProvision**、Sentence の Function は **main**（proviso ではない）、**SupplProvision（附則）祖先なし**。law/article/revision の誤記・off-by-one なし。
- **C（** raw 祖先チェーン・Function attr・キュー path・ArticleTitle で照合。確度: 高。
- **U（** 同 ¶1 にただし書（六月以内／九月以内の例外、NORM|626d5a7d… の EXCEPTION unit）が存在する。スコープ留保として F-1 に記録する。

#### CHECK 4 — 漢字「四」= 4・spec literal の監査可能性・durable pin

- **H（** 暗黙の常識ではなく、公式ジェネレータの `int_to_kanji` / `_kanji_int` を実行して双方向で確認し、spec の literal と pin のロードを機械的に検査する。
- **T（** `python review_checks2.py`（`sys.path` に `scripts/ci`）実出力:
  - `int_to_kanji(4) = 四` / `_kanji_int('四') = 4` / `kanji_variants(4) = {'四'}`（端末の文字化けは cp932 表示のみ、値は照合済み）。
  - `needle contains 四: True` / `source_literals_verified({4}, needle): True` / `clause_correspondence: (True, 'spec numerals / rate ratio in clause')`。
  - `spec_literals(spec) = {4}` / `kanji_literals = {'四'}`。spec は `def specMonthCap : Nat := 4` / `def specWithinPeriod m := decide (¬ specMonthCap < m)`。
  - `PrescribedPeriodWithinFourMonths in checks_by_module: True` / entry = `{'law_id':'406CO0000000416','article':'17','needles':['法第八条第九項に規定する政令で定める期間は、四月以内の期間とする。']}`。
- **D（** **PASS**。四 ↔ 4 は双方向成立。spec の `example : specMonthCap = 4 := rfl` はソース上の literal で監査可能。durable pin `data/TRANSCRIPTION_PINS/PrescribedPeriodWithinFourMonths.json` は `checks_by_module()` の pins_dir 走査から law id / article `17` / needle とともに実際にロードされている。
- **C（** needle leaf・INVENTORY 題名・ジェネレータ補助関数・pin ロード結果の 4 来源で照合。確度: 高。
- **U（** なし。

#### CHECK 5 — Lean 三ファイルの構造（循環／普遍定理／example／禁止トークン／axiom）

- **H（** 三ファイルを実読し、(1) `spec*` defs が impl 名を再利用しないか、(2) 有限サンプリングでなく全 Nat の kernel 一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 カテゴリか、(4) 実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` が無いか、(5) 普遍定理が公理自由かを検査する。
- **T（** `read` 三ファイル + `python review_checks2.py` / `review_checks3.py` + `lake env lean` 実出力:
  - 禁止トークン（`strip_comments` 後）: impl / spec / tests すべて `{sorry:0, admit:0, axiom:0, Classical.choice:0}`。impl の生テキストには各 1 命中するが、いずれも 31 行目の `No ...` doc コメント内の文字列のみで実行コードには 0。
  - 宣言数: impl `example=0, theorem=3` / spec `example=2, theorem=1` / tests `example=11`（generator の `example\s*:` 正規表現は 10。1 件は `example (x : Nat)` のパラメータ付きのため非計上）, `theorem=0`。合計 **11 example ≥ 5**。
  - `independent_spec_ok = True` / `impl_defs = {periodMonthCap, withinPrescribedPeriod}`。spec の `specMonthCap` / `specWithinPeriod` / `specMonthGrid` の body に impl 名の参照は **0**。循環なし。
  - ブリッジ定理 `agree_period_cap : ∀ months : Nat, withinPrescribedPeriod months = specWithinPeriod months` は 0..4 を case split し `Nat.succ` 5 連続の一般性 branch で `unfold ...; rfl`。**有限グリッドではなく全 Nat 全称**。
  - `boundary_evidence_categories(tests, literals={4}) = {'zero','small_input','saturation','threshold_at','threshold_above'}`（**5 カテゴリ ≥ 3**）。`threshold_below`（入力 3）は Tests に無いが impl の `three_true` 定理がカバー。
  - **axiom 検証**: `lake env lean`（lake = `C:\Users\user\.elan\bin\lake.exe`）で spec を import する scratch files に `#print axioms` を記述し実行。出力:
    - `'...agree_period_cap' does not depend on any axioms`
    - `'...specWithinPeriod' does not depend on any axioms`
    - `'...withinPrescribedPeriod' does not depend on any axioms`
- **D（** **PASS**。(1) spec は独立演算子 `¬ cap < months` を用い impl 名を再利用せず循環なし。(2) 一致定理は **全 Nat 全称**でカーネルが各 n を検証し、`#print axioms` により **AXIOM-FREE** を実確認（著者主張は事実）。(3) example 11（≥5）、境界カテゴリ 5（≥3）。(4) 実行コードの禁止トークン 0。
- **C（** Lean 源文件・ジェネレータ補助関数・`#print axioms` 実出力で照合。確度: 高（カーネル実行も再現済み）。
- **U（** `threshold_below` は Tests に無く、UNIT doc の境界カテゴリ記載（3 類）は generator 検出（5 類）と不一致（F-2 参照）。

#### CHECK 6 — 真の欠陥探索（以内 vs 未満／off-by-one／誤ラベル／弱 spec）

- **H（** 値・演算子・法身份・spec 独立性を意図的に反証しようと試み、「四月以内」を strict `<` や「未満」と取り違える誤り、4 の off-by-one、law/article/revision/sha の誤記、循環的 spec を探す。
- **T（** CHECK 1–5 の全出力に加え `python review_checks4.py` の全局キーワード走査:
  - `以内: 3`（needle の他、ただし書の六月以内・九月以内）/ `未満: 0` / `四箇月: 0` / `四か月: 0`。needle は「四月以内」を含み「未満」を含まない。
  - impl: `withinPrescribedPeriod 4 = true`（`cap_inclusive`）/ `5 = false`（`five_false`）/ `3 = true`（`three_true`）。`periodMonthCap = 4`。
  - 法 id `406CO0000000416` / 第十七条 / revision `..._20260401_508CO0000000085` / SHA `d974e780…21425` はすべて一次資料と一致（CHECK 1–3）。
- **D（** **判定: 具体的なブロッキング欠陥なし**。「以内」は包含的（`<=`）で正しく、「未満」への誤記なし。4 月ちょうどが成立し 5 月が不成立で off-by-one なし。law/article/revision/sha の誤表示なし。spec は独立かつ普遍で weak/circular ではない。非ブロッキングの F-1（ただし書スコープ）と F-2（doc 記載差・NORM 未登録）を記録する。
- **C（** raw JSON・INVENTORY・キュー・ジェネレータ・Lean 源文件の独立 5 来源で照合。確度: 高。
- **U（** 法的判断（ただし書の適用関係を含む）は人間に留保（LEGAL_REVIEW_PENDING）。

---

#### F-1（¶1 ただし書のスコープ明記 — 非ブロッキング・スコープ級）

- **H（** 「四月以内」は同一 ¶1 のただし書で六月以内／九月以内に延長され得る。impl の Scope 注記が「other articles and enforcement rules」としか書いておらず、同条文のただし書が明示的に除外されていないため、呼び出し側が `withinPrescribedPeriod` を Complete な法的判定として誤用し得ないか、という仮説。
- **T（** `review_checks4.py` / `review_checks5.py` 実出力。¶1 Sentence#2 = `ただし、次の各号のいずれかに該当する場合は六月以内の期間とし、次の各号のいずれにも該当する場合は九月以内の期間とする。`（kind=EXCEPTION, NORM|626d5a7d28b96b67ef2988bf1d42ab0ced03ceed724b75972c9f37e8d9aba0a3, 別 unit）。本 unit は Sentence#1（kind=DELEGATION）のみをモデル化。impl の `withinPrescribedPeriod 5 = false`。
- **D（** **判定: 事実だが非ブロッキング**。キュー分解がただし書を別 EXCEPTION unit として扱っており、本 unit のスコープ（main sentence のみ）はリポジトリ設計と整合。転記・符号化・「4 月上限」の中核意味論の誤りではない。
- **C（** raw ¶1 全文・キュー task 一覧・impl/UNIT doc の Scope 節を照合。確度: 高。
- **U（** 具体的修正: impl ヘッダの Scope と UNIT doc の「Not modelled」に「¶1 のただし書（六月以内／九月以内、NORM|626d… の EXCEPTION unit）および ¶2 は NOT MODELLED（caller-established）」を明記し、ただし書該当案例に `withinPrescribedPeriod` 単独を使用しない旨を呼び出し側へ警告する。truth value・定理は変更不要。

#### F-2（UNIT doc の記載差と NORM 未登録 — 非ブロッキング・ドキュメント／パイプライン級）

- **H（** UNIT doc の example 数・境界カテゴリ記載が実ファイル／generator と食い違い、また主張された NORM id がエビデンス台帳に未登録ではないか、という仮説。
- **T（** UNIT doc 28 行目 = `Tests: 10 kernel-decided examples; boundary categories {zero, small_input, saturation}`。実態: `example` 宣言 11 件（generator 計上 10 + パラメータ付き 1）、generator 検出カテゴリ 5 類（zero, small_input, saturation, threshold_at, threshold_above）。NORM id grep = 3 命中（UNIT doc + impl ヘッダ + spec ヘッダ）のみで `verification_evidence.json` / `EVIDENCE_GENERATION_AUDIT.json` には 0。
- **D（** **判定: 事実だが非ブロッキング**。記載は過小であって過大ではなく、kernel が検証する事実（example ≥5, 境界 ≥3）は満たす。NORM 登録は後工程と思料（同種の留保が既存レビューにもあり）。
- **C（** UNIT doc・Tests 源文件・generator 出力・repo 全体 grep で照合。確度: 高。
- **U（** 具体的修正: (a) UNIT doc 28 行目を `11 example declarations (10 generator-counted + 1 parameterized); 5 boundary categories {zero, small_input, saturation, threshold_at, threshold_above}` に更新し、`threshold_below` がない理由を注記（任意で Tests に `example : withinPrescribedPeriod 3 = true := by decide` を追加）。(b) パイプライン管理者に当該 NORM id の `verification_evidence.json` 登録予定を確認。いずれも意味論を変更しない。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった。** raw SHA-256（147316 bytes / `d974e780…21425`）、needle 全局一意性（1 件）、法身份（不当廉売関税等に関する政令 / 第十七条第一項 / MAIN / CurrentEnforced / revision `..._20260401_508CO0000000085`）、漢字四=4、durable pin の `checks_by_module()` ロード、spec の独立性と全 Nat 普遍一致定理（`#print axioms` により **AXIOM-FREE** を実確認）、example 11 件と 5 境界カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で **PASS**。「四月以内」を「未満」と誤る off-by-one も、law/article/revision/sha の誤記も、循環 spec も無し。F-1（¶1 ただし書のスコープ明記）、F-2（UNIT doc 記載差・NORM 未登録）はいずれもドキュメント／スコープ／パイプライン級の留保であり、転記・特定情報・「4 月上限（以内包含的）」の中核意味論の誤りではない。

**本レビューは法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** 特に ¶1 ただし書（六月／九月）の適用関係、法第八条第九項の実質、期間の測定対象、および本 unit を単独で法的判定に用いる可否は人間の判断に委ねる。
