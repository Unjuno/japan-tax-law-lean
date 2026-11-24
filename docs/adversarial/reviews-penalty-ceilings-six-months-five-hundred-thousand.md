### PenaltyCeilingsSixMonthsFiveHundredThousand.lean — 租税条約等特例法 art.13(4)（六月以下/五十万円以下）

独立レビュー（独立再抽出／独立抽出）。著者コメント・impl ヘッダ・UNIT ドキュメントは信頼せず、raw バイト・raw JSON・INVENTORY・監査スクリプト・Lean 源文件から再導出した。表記は **H/T/D/C/U**（H=反証可能な仮説／独立再抽出, T=検査コマンドと実出力, D=判定, C=照合・確度, U=未解決・留保）。本レビューでは指定された 1 ファイルのみを書き込み、対象モジュールの源文件・pin・他エージェントの `CommitteeTermTwoYears` 一切には触れていない。

---

#### CHECK 1 — raw SHA-256 再計算（CRLF→LF）

- H（ impl ヘッダの `sha256: cd3975f0…b9ce` は二次情報。raw バイトから独立再計算し、impl ヘッダと INVENTORY の両方と照合する。
- T（ PowerShell 7 / .NET SHA256 による実出力:
  - `bytes=703039` / `crlf=0` / `norm=703039`
  - `shaw=cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce`
  - `shan=cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce`
  - `hdr=cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce` / `match=True`
  - INVENTORY `raw_snapshot.source_sha256 = CD3975F0…B9CE`（大小文字違いのみ一致）、`size_bytes = 703039`（一致）。
- D（ **PASS**。bytes = **703039**、SHA-256 = **cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce**。正規化前後で同一。ヘッダ・INVENTORY と一致。
- C（ raw バイト・INVENTORY・impl ヘッダの 3 来源で照合。確度: 高。
- U（ 当該 JSON は CRLF を含まないため CRLF→LF 正規化は恒等。正規化の効果自体は検証不能だが報告値に影響しない。

#### CHECK 2 — 逐語 needle の独立走査・全局一致回数・法身份

- H（ needle は pin JSON から読み出し、raw JSON の全文字列リーフを再帰 walk して数える。ヘッダの path は使わない。
- T（ 実出力:
  - `needle_count=1`（raw 全体を文字列として走査した場合も 1）。
  - `HIT PATH: /?/Law#046[1]/LawBody[1]/MainProvision[39]/Article#13[5]/Paragraph#4[1]/ParagraphSentence[0]/Sentence#1[0]`（`[n]` は配列添字、`#Num` は属性）。
  - raw `revision_info`: `law_revision_id = 344AC0000000046_20260521_508AC0000000012`, `law_title = 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律`, `current_revision_status = CurrentEnforced`, `law_type = Act`。
  - INVENTORY `official_title` は同じ漢字列で一致、`current_revision.law_revision_id` と `current_revision_status` も一致、`selection_status = current_enforced`。
  - pin: `law_id = 344AC0000000046`, `kind = article`, `art = 第十三条`, needles = [`次の各号のいずれかに該当する場合には、その違反行為をした者は、六月以下の拘禁刑又は五十万円以下の罰金に処する。`]。
- D（ **PASS**。全局一致回数 = **1**。法 id・題名・リビジョン・施行状態は raw と INVENTORY で一致。needle の「一字一句改変なし」主張も成立。
- C（ raw JSON と INVENTORY の独立 2 来源で照合。確度: 高。
- U（ `NORM|06ce1bd2e2b43bb2fb31d77ec0beca6f0da0b72a0704e63fc9126cbf83722dc9` は UNIT ドキュメントと 2 つの Lean ヘッダにのみ存在し、`data/` 配下のエビデンスファイルには 0 命中。エビデンス登録は後工程と思料（非ブロッキング）。

#### CHECK 3 — 出所位置（第十三条・第四項・MAIN provision）

- H（ needle の祖先チェーンを tag/attr レベルで独立再構成し、附則（SupplementaryProvision / SupplProvision）配下でないことを確認する。
- T（ CHECK 2 の walk 出力より:
  - `Law(Num=046)` → `LawBody` → `MainProvision[39]` → `Article(Num=13)` → `Paragraph(Num=4)` → `ParagraphSentence` → `Sentence(Num=1)` → leaf。
  - `MainProvision` 祖先あり / `SupplementaryProvision` 祖先なし。needle 全局で 1 回のみなので、同名の附則条項に誤って入る余地はない。
  - impl ヘッダの `LawBody[1]/MainProvision/MainProvision[39]/Article:13/Article#13/Paragraph#4/...` は配列添字表記で独立 walk と整合。
- D（ **PASS**。記事 = **attr.Num "13"（第十三条）**、段落 = **attr.Num "4"（第四項）**、祖先は **MainProvision** で **附則なし**。off-by-one なし。
- C（ raw の祖先 attr と impl ヘッダを照合。確度: 高。
- U（ impl ヘッダの path 表記は `MainProvision[39]` を `MainProvision/MainProvision[39]` とやや冗長に書くが、添字の解釈差であり本文位置の同定には影響しない（表記上の留意点のみ）。

#### CHECK 4 — durable pin・漢字換算・spec_literals の原文照合

- H（ `generate_verification_evidence.py` の関数を実際に呼び、spec 定義から抽出される法定リテラルと漢字表記を原文 needle と照合する。pin が `checks_by_module()` に組み込まれることも実出力で確認する。
- T（ スクリプト関数呼び出しの実出力（予定値／実行確認値）:
  - `spec_literals(spec) = {6, 500000}`（spec の `example` 以前の定義のみが対象。`specPenaltyGrid` の足場リテラルは除外される）。
  - `int_to_kanji(6) = 六` / `int_to_kanji(500000) = 五十万`。
  - 両漢字は原文 needle 「**六**月以下の拘禁刑又は**五十万**円以下の罰金に処する。」に逐語出現。
  - `scoped_article_text('344AC0000000046','13')` に needle 含有。
  - `checks_by_module()['PenaltyCeilingsSixMonthsFiveHundredThousand']` が pin から生成される（pins_dir 走査、`name` の正規表現で base 抽出、`art = 第十三条` → `13` に正規化）。
  - `independent_spec_ok(spec, impl) = True`、`kernel-decided examples = 16`（Tests Module の `example :` 計 16。引数付き `example (m : Nat) :` の 2 本は同 regex に非該当だが普遍定理として別途適用）、`boundary categories = {zero, small_input, saturation, threshold_at, threshold_above}`（5 類）。
- D（ **PASS**。spec_literals は **{6, 500000}**、漢字は **六=6 / 五十万=500000** で双方向に成立し、すべて原文 Against で照合済み。durable pin は監査組込済み。
- C（ 監査スクリプトのコード・関数実行・raw 原文の 3 来源で照合。確度: 高。
- U（ `specPenaltyGrid` は有限 Bool 足場であり独立一致定理を弱化させない。足場を「独立 spec」と誤称しないようコメント済みである点を確認。

#### CHECK 5 — Lean 三ファイルの構造（循環／普遍定理／禁止トークン／axiom）

- H（ 三ファイルを実読し、(1) `spec*` defs が impl 名を再利用しないか、(2) 有限サンプリングでなく全 Nat の kernel 一致定理があるか、(3) `example` ≥5 かつ境界 ≥3 類か、(4) 実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` が無いか、(5) 両一致定理が axiom-free かを検査する。
- T（ 実読・実出力:
  - impl: `imprisonmentMonthsCap=6`, `fineYenCap=500000`, `withinImprisonmentCeiling m = decide (m <= 6)`, `withinFineCeiling y = decide (y <= 500000)`。定理 4 本（6/7/500000/500001 の境界）。
  - spec: `specImprisonmentMonthsCap=6`, `specFineYenCap=500000` を独自保持。`specWithinImprisonment` は `¬ cap < months`（impl と別演算子）、`specWithinFine` は `yen <= specFineYenCap`。spec 定義本体に impl 名の参照 **0**。
  - `agree_imprisonment_months : ∀ months : Nat, withinImprisonmentCeiling months = specWithinImprisonment months` は 0..6 を個別 decided、7 以上を `Nat.succ` 7 段の構造再帰 + `rfl` で全 Nat を網羅（普遍）。`agree_fine_yen (y : Nat)` は展開後 `rfl`（定義的に同一）。
  - `example`: impl 0 + spec 3 + tests 16（`example :` 形式。tests には引数付き普遍 2 本も別に存在）。境界は 0 / 6 / 7 / 500000 / 500001 を包含（≥3 類）。
  - 禁止トークン: コメント除去後の実行コードに `sorry`/`admit`/`axiom`/`Classical.choice` は **0**（impl の `No ...` doc コメントと spec の `axiom-free` コメントは文字列上の言及のみ）。
  - `lake env lean scratch.lean`（spec を import する一時ファイル）の `#print axioms` 実出力:
    - `'…agree_imprisonment_months' does not depend on any axioms`
    - `'…agree_fine_yen' does not depend on any axioms`
- D（ **PASS**。(1) 循環なし。(2) 一致定理は普遍（有限グリッドではない）。(3) example 16（≥5）、境界 ≥3 類。(4) 禁止トークン 0。(5) **両定理とも axiom-free**。
- C（ 源文件の実読とカーネル `#print axioms` の実出力で照合。確度: 高。
- U（ 一時 scratch ファイルは axiom 確認後に削除し、作業ツリーにはレビュー 1 ファイルのみを残す。

#### CHECK 6 — 真の欠陥探索（誤数値／累積 vs 選択／off-by-one／誤ラベル／弱 spec／空監査）

- H（ 以下の失敗モードを明示的に反証する: 六=6・五十万=500000 の誤記、`又は` を累積（両方適用）と誤読するか、境界の off-by-one、法・条・リビジョン・SHA の誤ラベル、spec の循環、literal 監査の空転。
- T（ 照合結果:
  - 数値: 原文「六月以下」「五十万円以下」に対し 6 / 500000。impl・spec・pin・tests すべて一致。誤記なし。
  - 選択肢: 原文は `六月以下の拘禁刑 **又は** 五十万円以下の罰金`。impl は 2 つの独立述語のみを公開し合成しない。ヘッダも「ALTERNATIVES, not cumulative」と明記。累積誤読なし。
  - off-by-one: `以下` は包含 → `<=`。6 と 500000 は true、7 と 500001 は false。定理・example が両側を固定。ずらしなし。
  - ラベル: law_id / revision / law_title / current_revision_status / SHA / size は raw・INVENTORY・ヘッダの 3 来源で一致（CHECK 1–3）。誤ラベルなし。
  - spec 循環: spec 定義は impl 名を参照せず、一致定理のみが両者を参照（独立 spec として健全）。
  - literal 監査空転: spec_literals は {6, 500000} で、両方とも原文に逐語出現。空でない。
- D（ **具体的欠陥は検出されず**。数値・選択肢・境界・ラベル・spec 独立・literal 監査の全軸で PASS。
- C（ 全 CHECK の実出力を相互照合。確度: 高。
- U（ 原文の「各号」条件・犯行要件・量刑規則・他項・施行規則は本モジュールのモデル外（caller-established）。本レビューは 2 つの数値上限の転写とその Kernel 表現のみを評価する。

---

**最終判定（verdict）**: 本レビューの監査範囲において、**具体的な欠陥（wrong numerals／cumulative-vs-alternative 誤読／off-by-one／誤ラベル／循環 spec／空の literal 監査）は検出されなかった**。raw SHA・needle 一意性・出所位置・漢字換算・spec 独立・普遍 axiom-free 一致定理・境界テストはすべて独立再抽出により照合済み。ただし、これは法的正确性を保証するものではなく、自然人による法学review（租税条約等特例法第十三条第四項の解釈・「各号」要件・他項との関係・施行日）は未完了であり、human legal review pending とする。
