# Independent adversarial review — QuotaApplicationCopyCountOne

Produced by a second, independent re-extraction path (fresh Python JSON walk and hash recomputation), because delegated adversarial subagents are unavailable (usage limit).

### QuotaApplicationCopyCountOne.lean — とうもろこし関税割当省令 art.1（提出部数は一通）

独立再抽出により原文・施行版・ハッシュをヘッダーではなくスナップショットから再計算し、実装・仕様・証明を照合した。H/T/D/C/U の各軸で判定する。

- **H（反証可能仮説）**: 関税割当申請書の提出部数は一通と定められている。これが誤りなら、needle の位置・数値・法令のいずれかが一致しない。
- **T（再現検査）**: 生データ `340M50010000013_20220401_504M60000200005.law.json`（13,031 bytes）の SHA-256 を再計算し `bffc3255…a2ba3` を得た（ヘッダー一致）。独立 JSON walk で needle は substring 1 回・exact leaf 1 回（パス `law_full_text/children[1]/children[2]/children[0]/children[2]/children[1]/children[0]/children[0]`）。`law_title` は「とうもろこし等の関税割当制度に関する省令」、`CurrentEnforced`。needle は第一条（本則）にのみ存在する。
- **D（合否）**: PASS。`int_to_kanji(1)=一` を確認。数値リテラル軸は構造数字 1 を除外するため空であり、空の軸を PASS とは言わない。原文対応は verbatim pin と明示的な漢字確認で担保する。一通は inclusive ではなく exactly-one として model 化し、0 通・2 通を棄却する closed example を確認した。
- **C（対立解釈）**: 「一通」を「一通以上」と読む説は `two_false` により棄却。実装名を仕様が再利用する循環はなく `independent_spec_ok = True`。仕様は厳格不等式 `n < 2 && 0 < n` という別定式を用い、普遍定理を場合分けでカーネル検証した。
- **U（不確かさ）**: 原文転写の忠実性のみ。別記様式第一の様式、申請書の記載内容、他の条項は未モデル化のまま保留（`LEGAL_REVIEW_PENDING`）。

追加確認: `example` 宣言 5 件、境界カテゴリ 3 種、禁止トークン 0 件、`#print axioms` により定理が公理非依存。

**判決**: 具体的な欠陥は検出されなかった。法的正确性の主張ではない。人間の法的レビューは保留とする。
