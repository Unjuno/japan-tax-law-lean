### TrainingPeriodOneYear.lean — 地価税法施行規則 art.3(6)(1)（一年以上）

独立レビュー（独立再抽出／独立抽出）。著者コメント・ヘッダ・UNIT ドキュメントは信頼せず、raw バイト・raw JSON・INVENTORY・監査スクリプト・Lean 源文件から再導出した。表記は **H/T/D/C/U**（H=反証可能な仮説／独立再抽出, T=検査コマンドと実出力, D=判定, C=照合・確度, U=未解決・留保）。作業ツリーの対象 5 ファイルはレビュー中に変更していない（本レビューは指定された 1 ファイルのみ書き込む）。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- H（ impl ヘッダの `sha256: 05474a3f…3816` は二次情報。raw バイトから独立再計算し、impl ヘッダと INVENTORY の両方と照合する。
- T（ `jtl_TPOY_analyze.py` 実出力:
  - `raw bytes on disk: 211857` / `CRLF count: 0` / `bare LF count: 0` / `normalized bytes: 211857`
  - `sha256(raw bytes as-is) = sha256(normalized CRLF->LF) = 05474a3f79500c643a169b991d9a1cefe7d03dea229849424d511a9f3db13816`
  - `impl header sha = 05474a3f79500c643a169b991d9a1cefe7d03dea229849424d511a9f3db13816` / both MATCH = True
  - INVENTORY: `source_file = data/raw/403M50000040031_20260401_508M60000040010.law.json`, `source_sha256 = 05474A3F…3816`（大小文字違いのみ）, `size_bytes = 211857`（一致）。
- D（ **PASS**。bytes = **211857**、SHA-256 = **05474a3f79500c643a169b991d9a1cefe7d03dea229849424d511a9f3db13816**。正規化前後で同一。
- C（ raw ファイル・INVENTORY・impl ヘッダの 3 来源が一致。確度: 高。
- U（ 当該 JSON は改行を含まないため CRLF→LF は恒等であり、正規化の効果自体は検証不能だが報告値に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- H（ needle は Unicode エスケープで独立構成し（cmd コードページ汚染回避）、JSON を再帰 walk して文字列リーフ単位と連結全文の両方で数える。ヘッダの path は使わない。
- T（ `jtl_TPOY_analyze.py` 実出力:
  - `total string leaves: 4451` / `needle substring hits (leaves): 1` / `needle occurrences in concatenated whole law: 1`
  - `HIT PATH: /law_full_text/children[1]/children[2]/children[2]/children[7]/children[2]/children[1]/children[0]/children[0]`
  - `HIT LEAF: 修業期間が一年以上であること。` / `HIT EXACT EQUAL: True`
  - raw: `revision_info/law_title = 地価税法施行規則`, `revision_info/law_revision_id = 403M50000040031_20260401_508M60000040010`, `revision_info/current_revision_status = CurrentEnforced`, `law_info/law_id = 403M50000040031`, `law_info/law_type = MinisterialOrdinance`
  - INVENTORY `current_revision`: 同上の revision id・題名・status、`amendment_enforcement_date = 2026-04-01`（今日 2026-11-24 と整合）。
- D（ **PASS**。全局一致回数 = **1**（部分文字列 1、完全一致 leaf 1）。法 id・題名・リビジョン・施行状態は raw と INVENTORY で一致。needle の「一字一句改変なし」主張も成立。
- C（ raw JSON と INVENTORY の独立 2 来源で照合。確度: 高。
- U（ `NORM|f419b346978e27bf42b959afb590a4b25283346677b360f6c0c6e56d429b8c8f` は UNIT ドキュメントと 2 つの Lean ヘッダにのみ存在し、`data/verification_evidence.json` / `data/EVIDENCE_GENERATION_AUDIT.json` には 0 命中。エビデンス登録は後工程と思料（非ブロッキング、パイプライン管理者に確認推奨）。

#### CHECK 3 — 出所位置（第三条・第六項・第一号・MAIN provision）

- H（ needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplProvision）配下でないことを確認する。
- T（ `jtl_TPOY_analyze.py` / `jtl_TPOY_analyze2.py` 実出力:
  - `Law(attr Num=031)` → `children[1] LawBody` → `children[2] MainProvision` → `children[2] Article attr={'Num':'3'}` → `children[7] Paragraph attr={'Num':'6'}` → `children[2] Item attr={'Num':'1'}` → `children[1] ItemSentence` → `children[0] Sentence attr={'Num':'1','WritingMode':'vertical'}` → leaf。
  - `has MainProvision ancestor: True` / `has SupplProvision ancestor: False`
  - `Article count whole law: 14`、Article `Num=3` は全局で一意、`ArticleTitle = 第三条`。¶6 は「全ての要件を満たす課程」について 6 号を列挙し、needle はその第一号。¶6 に `ただし` はなし。
  - impl ヘッダの `LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#6/Item#1/ItemSentence/Sentence#1` は 0-based child index 表記（`LawBody[2]` = MainProvision, `MainProvision[2]` = Article 3）で、独立 walk と整合。同記法は `GrayscaleGradationFloor.lean` ヘッダでも確認。
- D（ **PASS**。記事 = **attr.Num "3"（第三条）**、段落 = **attr.Num "6"（第六項）**、号 = **attr.Num "1"（第一号）**、祖先は **MainProvision** で **SupplProvision（附則）なし**。HEADER の path 表記・Article/Paragraph/Item の off-by-one なし。
- C（ raw の祖先 attr と impl ヘッダを照合。確度: 高。
- U（ 当該 Sentence は `Function` attr を欠く（全局分布: absent 479 / main 4 / proviso 4）。e-Gov の既定は main であり、MainProvision 祖先 + proviso 不在により MAIN と判定した。表記上の留意点のみ。

#### CHECK 4 — durable pin の監査組込と新規監査実行・漢字「一」= 1

- H（ pin が `transcription_audit.py` の手書きリストではなく `data/TRANSCRIPTION_PINS/*.json` 経由で `checks()` に読み込まれることを、ソース読取と実際の yield の両方で確認する。
- T（ `jtl_TPOY_analyze.py` 実出力:
  - `checks()` が当該 pin を **1 件** yield: name = `地価税法施行規則 art.3(6)(1)（修業期間一年以上）↔ TrainingPeriodOneYear.lean (floor 1, 以上 inclusive)`, law_id = `403M50000040031`, kind = `article`, art = `第三条`, needles = [`修業期間が一年以上であること。`]。
  - `PIN haystack found: True` / scoped article に needle 含有 True / 全局にも含有 True。
  - 新規実行 `python scripts/ci/transcription_audit.py`: exit code **0**、`PASS  地価税法施行規則 art.3(6)(1)…`、`transcription audit: 467/467 checks passed`。
  - `int_to_kanji(1) = 一` / `_kanji_int('一') = 1` / `kanji_variants(1) = {'一'}`。
  - needle は `一年以上` と `以上` を含む。`未満` は含まない（len 15）。
- D（ **PASS**。durable pin は `checks()` の pins_dir 走査（transcription_audit.py:94–104）から確実に読み込まれ、fresh audit は 467/467 で通過。漢字「一」= 1 は双方向に成立。spec に抽出 literal がないのは 1 が構造値であるためで、needle が条項全体の構造アンカーとして機能する。
- C（ 監査スクリプトのコード・実行結果・ジェネレータ補助関数の 3 来源で照合。確度: 高。
- U（ spec 内の `specTrainingGrid` は有限 Bool 足場として `<=` を再記述するが、一致の証明は普遍定理が担うため循環ではない。足場を「独立 spec」と誤称しないようコメント済みである点を確認。

#### CHECK 5 — Lean 三ファイルの構造（循環／普遍定理／example／禁止トークン）

- H（ 三ファイルを実読し、(1) `spec*` defs が impl 名を再利用しないか、(2) 有限サンプリングでなく全 Nat の kernel 一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 類か、(4) 実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` が無いかを機械的に検査する。
- T（ `jtl_TPOY_analyze.py` 実出力:
  - 実行コード（コメント除去後）の禁止トークン: impl / spec / tests すべて `{sorry:0, admit:0, axiom:0, Classical.choice:0}`。impl の生テキストには各 1 命中するが、30 行目の `No ...` doc コメント内の文字列のみ。
  - def: impl `trainingFloorYears`, `meetsTrainingPeriod` / spec `specTrainingFloor`, `specMeetsTraining`, `specTrainingGrid`。spec の各 def body に impl 名の参照は **0**。
  - `example`: impl 0 + spec 2 + tests 10 = **12**。`theorem`: impl 3（`floor_inclusive`, `zero_false`, `two_true`）+ spec 1。
  - ブリッジ定理: `agree_training_floor (years : Nat) : meetsTrainingPeriod years = specMeetsTraining years`（`by_cases` + `omega` + `simp`、全 Nat を網羅）。
  - Tests の境界: `meetsTrainingPeriod 0 = false` / `1 = true` / `2 = true`、任意 `x` への定理適用も有り。
- D（ **PASS**。(1) spec は独立演算子 `¬ years < 1` を用い impl 名を再利用せず循環なし。(2) 一致定理は **普遍**（有限グリッドではない）。(3) example 12（≥5）、境界は {0: 未満, 1: ちょうど下限, 2: 上限超} の **3 類**。(4) 実行コードの禁止トークン 0。
- C（ 構造は高確度。`omega` は `TaxFinance.lean` の `import Std` 経由で利用可能（リポジトリ内 95 Lean ファイルが同 tactic を使用）。ただし単一書き込み制約のため `lake build` は実行していない。確度: 構造は高、カーネル実行の再現は中。
- U（ `lake build` によるカーネル再検証はレビュー担当者の実行に委ねる。`specTrainingGrid` の `<=` は足場であり独立一致定理を弱化させない点を上記 CHECK 4 で確認済み。

#### CHECK 6 — 真の欠陥探索（以上 vs 未満 / off-by-one / 誤ラベル / 弱 spec）

- H（ 値・演算子・法身份・spec 独立性を意図的に反証しようと試み、「一年以上」を strict `>` や `未満` と取り違える誤り、1 の off-by-one、law/article/revision/sha の誤記、循環的 spec を探す。
- T（ CHECK 1–5 の全出力に加え `jtl_TPOY_analyze.py` の全局キーワード走査:
  - `修業 = 1` / `一年以上 = 1` / `一年未満 = 0` / `一年を超え = 0` / `一年以上であること = 1`。
  - Article 3 ¶6 全文で第一号のみが「修業期間が一年以上であること。」、第二号は「一年の授業時間数 … 六百八十時間以上」、第三号以下は別要件。¶6 は「全ての要件を満たす」と規定。
  - impl は `trainingFloorYears = 1`、`meetsTrainingPeriod 1 = true`、`0 = false`、`2 = true`。UNIT ドキュメントの「training period >= 1 year」と同値。
- D（ **判定: 具体的なブロッキング欠陥なし**。以上は包含的（`>=`）で正しく、未満/超えへの誤記なし。1 年ちょうどが成立し 0 年が不成立で off-by-one なし。法 id・第三条・第六項・第一号・revision・SHA の誤表示なし。spec は独立かつ普遍で、weak/circular ではない。
- C（ raw JSON・INVENTORY・監査実行・Lean 源文件の独立 4 来源で照合。確度: 高。
- U（ 非ブロッキングの留保を 2 件記録する。(F-1) `meetsTrainingPeriod` は ¶6 の 6 要件の **1 号のみ** をモデル化しており、¶6 全体の充足判定に単独で用いてはならない（impl ヘッダと UNIT ドキュメントは既に NOT MODELLED と明記）。具体的修正: 呼び出し側へ「¶6 の他 5 号は caller-established」を徹底するコメント、または 6 号を conjunction として束ねる上位述語を別ユニットで提供する。(F-2) ヘッダの英訳 `Land Value Tax Act Enforcement Order` は 省令（MinisterialOrdinance）に対する `Order`（通常 政令）との表記揺れ。具体的修正: `Enforcement Ordinance/Regulation` に改める。いずれも符号化・転記・意味論の誤りではない。

---

### Verdict

**具体的なブロッキング欠陥は検出されなかった。** raw SHA-256（211857 bytes / `05474a3f…3816`）、needle 全局一意性（1 件）、法身份（地価税法施行規則 / 第三条第六項第一号 / MAIN / CurrentEnforced）、durable pin の監査組込と fresh audit 467/467、漢字「一」= 1、spec の独立性と全 Nat 普遍一致定理、example 12 件と 3 以上の境界カテゴリ、実行コードの禁止トークン 0 — すべて独立再抽出で PASS。F-1（¶6 の他号のスコープ）と F-2（英訳表記）は非ブロッキングの留保であり、転記・意味論・特定情報の誤りではない。

**本レビューは法的正確性を主張するものではない。人間の法的レビューは未完了（LEGAL_REVIEW_PENDING）。** 特に「修業」の定義・¶6 の他号・適用関係の法的取扱い、および `lake build` によるカーネル再検証は人間の判断・実行に委ねる。
