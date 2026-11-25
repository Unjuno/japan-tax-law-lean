# Independent adversarial review — SecrecyBreachPenaltyCeilings

This review was produced by a second, independent re-extraction path (fresh Python JSON walk and hash recomputation), because the delegated adversarial subagent was unavailable due to a usage limit. H/T/D/C/U findings are recorded per check.

### SecrecyBreachPenaltyCeilings.lean — 租税特別措置透明化法 art.12（二年以下/百万円以下）

独立再抽出（原文・施行版・ハッシュをヘッダーではなく原文スナップショットから再計算）を行い、実装・仕様・証明を照合した。H/T/D/C/U の各軸で判定する。

- **H（反証可能仮説）**: 本条は業務上知り得た秘密の漏えいに対し、二年以下の拘禁刑又は百万円以下の罰金を定める。これが誤りなら、数値・条・法令のいずれかが一致しないはずである。
- **T（再現検査）**: 生データ `422AC0000000008_20260401_507AC0000000013.law.json`（57,188 bytes, CRLF 0）の SHA-256 を再計算し `c77407cb…abff11` を得た。これは実装ヘッダーおよび INVENTORY と一致。独立 JSON walk で 対象の needle は全法文中に substring 1 回・exact leaf 1 回のみ（パス `law_full_text/children[1]/children[1]/children[11]/children[2]/children[1]/children[0]/children[0]`）。`revision_info.law_title` は「租税特別措置の適用状況の透明化等に関する法律」、`current_revision_status` は `CurrentEnforced`。
- **D（合否）**: PASS。needle は第12条（Num=12）第一項、本則にのみ存在し、附則にはない。`int_to_kanji(2)=二`、`int_to_kanji(1000000)=百万` を直接確認し、`spec_literals == {2, 1000000}` の全てが原文で検証された。`checks_by_module()` は durable pin を読み込む。
- **C（対立解釈）**: 「以下」を厳格 `<` と読む説は `two_months_inclusive` と `one_million_inclusive` により棄却される。「又は」を累積と読む説に対しては、二つの上限を独立述語として分離し累加していないことを記録する。実装を仕様に再利用する循環はなく、`independent_spec_ok = True`。
- **U（不確かさ）**: 原文転写の忠実性のみを検証しており、法的妥当性を検証しない。第九条の義務、犯意・構成要件、量刑、他の条項は未モデル化のまま保留（`LEGAL_REVIEW_PENDING`）。

追加確認: `example` 宣言 16 件、境界カテゴリ 5 種（zero / small_input / saturation / threshold_at / threshold_above）、禁止トークン（sorry/admit/axiom/Classical.choice）は実行コードに 0 件。`#print axioms` により両方の普遍定理が公理非依存であることをカーネルで確認した。

**判決**: 具体的な欠陥は検出されなかった。これは法的正确性の主張ではない。人間の法的レビューは保留とする。
