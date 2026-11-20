### CapitalOneBillionExcess.lean — 国税臨時特例法 art.7(1)(1)（十億円超）

独立再抽出（一次資料からの直接再抽出）を行い、impl ヘッダの各主張を照合・判定した。
H/T/D/C/U 形式で各検査を記録する（H=反証可能仮説, T=再現テスト, D=判定, C=競合解釈, U=不確実性/範囲外）。

法主題: 国税臨時特例法 第七条第一項第一号イ（大規模法人の定義細目）
原文逐語: 「資本金の額又は出資金の額が十億円を超える法人」
Normative unit: NORM|3b1013fc326dbfcb98839b2a2a363fb2569d565af04514f05fe362ce89d7d027

## 独立再抽出・照合レコード（H/T/D/C/U）

### Check 1 — スナップショット SHA-256
- H（ヘッダの sha256 は data/raw/... の実バイトを CRLF→LF 正規化後の SHA-256 と一致する）
- T（python で open(...,'rb').read() → .replace(b'\r\n',b'\n') → hashlib.sha256(...).hexdigest()。観測: RAW_BYTE_LEN=108764, CRLF_COUNT=0, BARE_CR_COUNT=0, NORM_BYTE_LEN=108764, SHA256_RAW=SHA256_NORM=410e0d9715f6ea70fe2a9ca6c986a70abec48a3cbabe625fb54aabaa18efaa23）
- D（PASS — 計算値 410e0d...efaa23 はヘッダ記載値と完全一致。 INVENTORY laws[291].raw_snapshot.source_sha256 = 410E0D...EFAA23（大文字）も同値。実バイト 108764 bytes。）
- C（CRLF 正規化は no-op（CRLF ゼロ）。仮に移植時に CRLF が混入しても正規化後ハッシュは不変で、この照合は頑健。）
- U（ネットワーク上の e-gov 原本との突合は未実施。ここではローカル固定スナップショットのみを検証。）

### Check 2 — 逐語 needle の独立抽出・出現回数・タグ経路
- H（needle は全法文中にちょうど 1 回だけ出現し、第七条(1)(1)イの Subitem1Sentence/Sentence#1 の葉にある）
- T（json.load 後に全ノードを再帰 walk。観測: NEEDLE_OCCURRENCE_COUNT=1, SUBSTRING_COUNT_IN_RAW_TEXT=1。経路: $/law_full_text/children[1](LawBody)/children[1](MainProvision)/children[7](Article Num=7)/children[2](Paragraph Num=1)/children[2](Item Num=1, ItemTitle='一')/children[2](Subitem1 Num=1, Subitem1Title='イ')/children[1](Subitem1Sentence)/children[0](Sentence Num=1)/children[0]。LEAF_TEXT='資本金の額又は出資金の額が十億円を超える法人' EXACT_EQUAL=True。）
- D（PASS — 出現 1 回、葉テキストは逐語一致。Article Num=7 / Paragraph Num=1 / Item '一' / Subitem1 'イ' で、ヘッダの「第七条 第一項 第一号 第一細目(イ)」表記と整合。ArticleCaption は「（大規模法人等以外の法人の欠損金の繰戻しによる還付）」で、当該文は Item 一 の ItemSentence「大規模法人（次に掲げる法人をいう。…）」にぶら下がる定義細目であることを確認。）
- C（ヘッダの Path 表記は Subitem1#1 だが、実 JSON の children 添字は [7]/[2]/[2]/[2]（caption/title が前を占める）。# は論理番号、[] は配列添字で矛盾しない。Subitem1Title は 'イ'（かな順 1 番目）であり「第一細目」で正しい。）
- U（「大規模法人の定義の一部であり、ただし書の例外発動要件である」という法的文脈はヘッダの Scope に明示されていない（後述 F2）。DOWNSTREAM の条文解釈は人間の法的レビューに委ねる。）

### Check 3 — 法主体の同一性と revision
- H（raw の law_title / revision_id / current_revision_status は INVENTORY.json の当該 law エントリと一致する）
- T（raw revision_info.law_title='新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律'、law_revision_id='502AC0000000025_20260401_508AC0000000012'、current_revision_status='CurrentEnforced'。INVENTORY laws[291]: law_id='502AC0000000025', official_title=同一文字列, current_revision.law_revision_id=同一, current_revision_status='CurrentEnforced', raw_snapshot.source_file='data/raw/502AC0000000025_20260401_508AC0000000012.law.json'。）
- D（PASS — 全フィールド一致。revision id の誤記なし。法名/条番号の誤ラベルなし。）
- C（INVENTORY は辞書ではなく {"snapshot_date","summary","laws":[...]} 構造のため、法 id を直接キーにすると 0 件になる。laws 配列を走査すれば laws[291] に一意に存在する。）
- U（INVENTORY の selection_status='current_enforced' と raw の current_revision_status='CurrentEnforced' は別フィールドだが同趣旨。法の官報掲載日等の外部事実は未検証。）

### Check 4 — 十億円 = 1,000,000,000 の検証
- H（十億 = 10×10^8 = 1,000,000,000 であり、spec の数値リテラル 1_000_000_000 は原文の漢字「十億」から導出可能である）
- T（generator を import して実行: ve.int_to_kanji(1000000000)='十億'; ve._kanji_int('十億')=1000000000; source_correspondence.kanji_number('十億')=1000000000; AMOUNT_RE.findall(clause)=['十億']; ve.spec_literals(spec_text)={1000000000}; {int_to_kanji(v) for v in lits}={'十億'}; clause_correspondence(...)= (True,'spec numerals / rate ratio in clause')。整数 reasoning: 十=10, 億=10^8 → 10^9。）
- D（PASS — 漢字 numeral と numeric literal は generator 自身の双方向変換で整合。原文に「十億」が実在するため、spec の 1_000_000_000 は原文照合可能。）
- C（normative_core.kanji_to_int('十億') は ValueError（十/百/千のみ対応、万/億非対応）。これは条番号パーサの仕様であり金額換算を担うものではない。金額換算は generate_verification_evidence.int_to_kanji / _kanji_int と source_correspondence.kanji_number が担当し、そちらは 億 を正しく扱う。よって欠陥ではない。）
- U（監査は漢字 spelling で原文一致を検証するのであり、Lean の 1_000_000_000 という十進表記そのものを原文と直接突き合わせているわけではない。変換関数が共有する前提（億=10^8）は外部仕様として受け入れている。）

### Check 5 — Lean 三ファイルの構造（circularity / 普遍定理 / 例 / 禁止トークン）
- H（spec* 定義は impl 定義名を再利用せず、普遍的な kernel-checked 合意定理があり、例≥5・境界カテゴリ≥3・禁止トークンなし）
- T（grep と gve ヘルパを実行: independent_spec_ok=True, impl_defs={'exceedsCapitalBillion','capitalBillionFloor'}。specExceedsCapital は decide (Nat.succ specCapitalBillionFloor <= amount) で `<` ではなく `<=`（succ により strict と同値）。agree_capital_billion (amount:Nat) は全 Nat 対象の普遍定理。レビュー中に著者が commit 28b84bb 後に証明を Nat.succ_le_of_lt/Nat.lt_of_succ_le から `by omega` へ書換えたことを確認（現在の実コードは `by omega`）。omega は本プロジェクトでは Std 経由で利用可（lake-manifest.json の packages=[]、lean-toolchain v4.35.0、他モジュール CustomsInvestigationDeadlineSpec / DisasterIncomeTaxRelief 等が omega を使用しビルド済み）。example 数=10（tests; 他 spec に 1）。boundary_evidence_categories={'zero','small_input','saturation'}。FORBIDDEN_PROOF は strip_comments 後 impl/spec/tests すべて []（impl の生テキストにはコメント行「No `sorry`, `admit`, `axiom` or `Classical.choice`.」が hit するがコメント除去後はゼロ）。）
- D（PASS — circularity なし。普遍定理は有限サンプリングではなく全 Nat を kernel が検証する形。例 10≥5、境界カテゴリ 3>=3。実コードに sorry/admit/axiom/Classical.choice なし。transcription_audit.py 実行で新 pin は PASS、全体 196/196 checks passed。）
- C（「saturation」カテゴリは (g) 1_000_000_000+0=1_000_000_000 や (a)/(h)/(j) の恒等式・定数例で充足しており、述語自体の saturation を直接測っているわけではない（F1 参照）。ただし真のしきい値境界は (d)=999_999_999,(e)=1_000_000_000,(f)=1_000_000_001 で別途カバーされている。）
- U（ローカルに lake/lean が未インストール（where lake / where lean とも空）のため、agree_capital_billion の証明が実際に型検査を通るかはコンパイル未確認。証明は Nat.succ_le_of_lt / Nat.lt_of_succ_le の標準補題を用いた妥当な構成に見える。kim のカーネル検証は F1 の状況依存。）

### Check 6 — 演算子・off-by-one（超える vs 以上）
- D（PASS — 原文は「超える」= strict >。impl は decide (floor < amount)、spec は decide (succ floor <= amount) でいずれも strict。floor_exclusive: exceeds 1_000_000_000 = false、first_above: exceeds 1_000_000_001 = true、zero_false: exceeds 0 = false。「以上」(>=) の誤用なし、1 円の off-by-one なし。）
- H（境界で 以上 (>=) と誤れば 1_000_000_000 が true になるはず）
- T（tests の (e) と floor_exclusive が false を kernels 决定。spec の succ<= も 1e9 で false。）
- C（「資本金の額又は出資金の額」の「又は」は資本/出資の_selection_ を表すが、両者とも同一しきい値なので単一 amount パラメータへの還元は健全。）
- U（法人格の認定や「出資金」の算定方法など法的事実の判定はモデル外。）

## Findings（genuine issues）

### F1 — 新規三ファイルに kernel attestation が未登録（具体的欠陥・中程度）
- H（「universal kernel-checked agreement theorem」と主張するなら、PROJECT の検証エビデンス鎖（attestation）に当該モジュールのハッシュが登録され、generate_verification_evidence が本ユニットを採用すべきである）
- T（全 PROOF_ATTESTATION*.json を走査: PROOF_ATTESTATION.json / _PER_CAPITA.json / _SCOPED.json のいずれも CapitalOneBillionExcess モジュールを保持しない。直接 ve.kernel_attested(att,'CapitalOneBillionExcess') を実行 → False。needed modules in attestation modules: []。`if not (ok and ...)` により build() は本ユニットを continue でスキップする。また where lake/lean が空でローカル再コンパイルも不能。）
- D（FAIL — 当該 triple は未コミット新規のため attestation 未登録は構造的に生じうるが、現時点では「kernel-checked である」という主張を PROJECT のエビデンスが裏付けていない。review_ok のフォーマットは充足（review_ok(probe)=True）するが kernel_attested=False のため verification evidence は生成されない。）
- C（「これは新規ワークが CI をまだ通していないだけで、コード上の欠陥ではない」という解釈は成立する。 attestation は green CI 実行後に生成される運用である。よってこれは CODE の誤りではなく EVIDENCE の未接続である。）
- U（コンパイル成功自体は未検証（ローカル Lean なし）。attestation 登録は担当エージェント/CI の次の green run に委ねる。）
- 修正提案: この三ファイルを CI の green run（Build Lean project and check axioms）に含め、PROOF_ATTESTATION（または scoped attestation）に 3 モジュールの blob sha256 を登録する。登録後に generate_verification_evidence.build() が本ユニットを採用することを確認する。

### F2 — 法文脈の開示が不十分（軽微・法的レビュー事項）
- H（ヘッダ Scope が「条件のみをモデル化し gating される特例措置は NOT MODELLED」と明記している以上、誤解は生じないはず）
- T（第七条を render した結果: Item 一 の ItemSentence='大規模法人（次に掲げる法人をいう。次号及び第三号において同じ。）'、needle はその Subitem1 イ、Para1 はただし書「…次に掲げる法人に該当する場合は、この限りでない。」で欠損金繰戻し還付の例外を構成。）
- D（PASS with caveat — モデル化対象は「十億円超」という金額条件のみで正しい。ただしヘッダは、当該条件が「大規模法人」定義の細目であり、欠損金繰戻し還付の例外発動要件であることを明示していない。Scope の NOT MODELLED 宣言と矛盾はしないが、文脈の開示としては弱い。）
- C（意図的な狭いスコープ宣言であり「false claim about scope」には当たらない。むしろ誠実な限定記述と読める。）
- U（当該例外の法的効果・適用範囲の解釈は本レビューの範囲外。人間の法的レビューに委ねる。）
- 修正提案（任意）: ヘッダ Scope に「本条件は 大規模法人 の定義細目（第一号イ）であり、第七条ただし書の還付制限の発動要件である；当該効果自体は NOT MODELLED」を一行追記する。

## Verdict

具体的な CODE 欠陥（誤演算子 超える/以上、off-by-one、誤法条・誤 revision、誤 sha256、circular spec、sorry/admit 等）は検出されなかった。全ての一次資料照合（SHA-256、needle 一意性・タグ経路、法主体同一性、漢字数値、strict 演算子、境界）は PASS である。

ただし F1 として、当該新規 triple には kernel attestation が未登録であり、現時点では「普遍的な kernel-checked 定理」という主張が PROJECT のエビデンス鎖で裏付けられていない（未コミット新規ワークの運用上生じうる状態）。F2 は軽微な文脈開示の改善提案であり正确性に影響しない。

本レビューは転記忠実性・構造・エビデンス接続の機械的照合のみを行ったものであり、いかなる法的正确性（法的効力、適用解釈、 tangent な条文との相互作用を含む）も主張しない。法的正确性については人間の法的レビューが未了（pending）である。
