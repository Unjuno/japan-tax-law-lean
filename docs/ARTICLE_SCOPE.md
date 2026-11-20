# Norm-unit scoped fidelity diagnostic (machine-generated)

Do not hand-edit. Regenerate with `python scripts/law_audit/phase_e/article_scope.py`.

Objective §1: a numeric match anywhere in the whole pinned text is NOT
article-level or norm-level verification. This report records, per
transcription check, which norm unit (with exact offsets) contains the
needle, whether the decomposition covers the original, and which text
remains UNRESOLVED.

- checks with norm-unit-scoped needles: 126
- checks with no scoped unit (whole-text/cross-unit needles): 33
- UNRESOLVED norm units across checked laws (counted once per law): 253866
- units failing independent coverage audit: 0

| law_id | stated article | needles | units | containing norm units | unresolved | coverage_fail | check |
|---|---|---:|---:|---|---:|---:|---|
| `340AC0000000034` | 第六十六条 | 4 | 12849 | ee4d1b8beb[EXCEPTION]@568-669×1; 21eb8fc1c2[EXCEPTION]@6473-6574×1; 788f54c7da[LEGAL_EFFECT]@105-179×1; f4ba63650d[EXCEPTION]@203-341×3 | 7337 | 0 | 法人税法 art. 66（法人税率） |
| `325AC0000000073` | 第二十一条の七 | 5 | 3196 | 31443ab51f[UNRESOLVED_NORM]@0-13×1; 2c226c88e4[UNRESOLVED_NORM]@0-21×1; b5460dc082[UNRESOLVED_NORM]@0-20×1; 4300086b6d[UNRESOLVED_NORM]@0-22×1 | 1779 | 0 | 相続税法 art. 21-7（贈与税の税率） |
| `325AC0000000073` | 第二十一条の五 | 1 | 3196 | b339abaf70[LEGAL_EFFECT]@10-35×1; c2b0d22cc3[LEGAL_EFFECT]@20-95×1 | 1779 | 0 | 相続税法 art. 21-5（贈与税の基礎控除・六十万円） |
| `340AC0000000033` | 第八十九条 | 4 | 19912 | f892838a75[UNRESOLVED_NORM]@0-15×1; 9b57aefc66[UNRESOLVED_NORM]@0-26×1; 8a4e9f64c1[UNRESOLVED_NORM]@0-23×1; 745147e1f0[UNRESOLVED_NORM]@0-16×1 | 14660 | 0 | 所得税法 art. 89(1)（税率） |
| `342AC0000000023` | (file-level) | 4 | 1923 | b43df8deed[EXCEPTION]@392-663×4; d34c45852d[EXCEPTION]@125-398×2 | 976 | 0 | 印紙税法 別表第一 第一号（契約書） |
| `342AC0000000023` | (file-level) | 2 | 1923 | d34c45852d[EXCEPTION]@125-398×2; fb441ff3cb[UNRESOLVED_NORM]@57-334×1; e2202fa35e[EXCEPTION]@607-1002×1 | 976 | 0 | 印紙税法 別表第一 第二号（請負に関する契約書） |
| `332AC0000000026` | 第三十一条の四 | 1 | 60225 | 1da5d33b41[EXCEPTION]@16-141×1 | 29714 | 0 | 租税特別措置法 art. 31の4（長期譲渡所得の概算取得費） |
| `332AC0000000026` | 第六十七条の二 | 1 | 60225 | a4e9c0bc60[EXCEPTION]@192-273×1 | 29714 | 0 | 租税特別措置法 art. 67の2(1)（特定の医療法人の法人税率の特例・百分の十九） |
| `332AC0000000026` | 第六十八条 | 1 | 60225 | (no norm unit contains the needle text) | 29714 | 0 | 租税特別措置法 art. 68(1)(2)（特定の協同組合等の法人税率の特例） |
| `325AC0000000073` | 第十九条の二 | 3 | 3196 | 258c9a8919[REFERENCE]@319-542×1 | 1779 | 0 | 相続税法 art. 19-2（配偶者に対する相続税額の軽減・イの法定相続分／一億六千万円の下限額・ロの課税価格） |
| `332AC0000000026` | 第八十七条の二 | 4 | 60225 | bb68c0b862[EXCEPTION]@26-96×1 | 29714 | 0 | 租税特別措置法 art. 87の2（低アルコール分の蒸留酒類等に係る酒税の税率の特例: 十一度未満 10万円／十一度以上 |
| `332AC0000000026` | 第九条の三の二 | 3 | 60225 | 324b16e66b[DELEGATION]@270-498×2; c5997e8b8f[APPLICATION_CONDITION]@911-1042×1 | 29714 | 0 | 租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例: 百分の十五（大口株主等については百 |
| `332AC0000000026` | 第三十一条の三 | 3 | 60225 | 791c354d98[EXCEPTION]@27-232×1; 41e55f2c93[UNRESOLVED_NORM]@533-571×1 | 29714 | 0 | 租税特別措置法 art. 31の3（居住用財産を譲渡した場合の長期譲渡所得の課税の特例: ¥60,000,000 以下で |
| `332AC0000000026` | 第七十条の二の五 | 2 | 60225 | 5ff5a09450[UNRESOLVED_NORM]@0-13×1; e70d00e1b7[UNRESOLVED_NORM]@0-18×1 | 29714 | 0 | 租税特別措置法 art. 70の2の5(1)（直系尊属から贈与を受けた場合の贈与税の税率の特例） |
| `332AC0000000026` | 第九十一条 | 4 | 60225 | (no norm unit contains the needle text) | 29714 | 0 | 租税特別措置法 art. 91(1)(2)（不動産譲渡契約書等に係る印紙税の税率の特例） |
| `340AC0000000034` | 第六十七条 | 8 | 12849 | 50ee573bfd[UNRESOLVED_NORM]@2816-2830×1; 8301263ec2[LEGAL_EFFECT]@2948-3143×3 | 7337 | 0 | 法人税法 art. 67(1)(5)(6)（特定同族会社の留保金額に加算される特別税率 10/15/20%・留保控除額・ |
| `325AC0000000073` | 第十八条 | 1 | 3196 | d3f9b39638[EXCEPTION]@111-196×1 | 1779 | 0 | 相続税法 art. 18(1)（相続税額の加算・百分の二十） |
| `337AC0000000066` | 第百十八条 | 1 | 4169 | d4ed0a3d26[APPLICATION_CONDITION]@98-165×1 | 2523 | 0 | 国税通則法 art. 118(1)（課税標準の端数計算等・千円未満切り捨て） |
| `337AC0000000066` | 第百十九条 | 1 | 4169 | d656d7e0fb[APPLICATION_CONDITION]@49-106×1 | 2523 | 0 | 国税通則法 art. 119(1)（確定金額の端数計算等・百円未満切り捨て） |
| `325AC0000000073` | 第十五条 | 1 | 3196 | 05fb23159a[UNRESOLVED_NORM]@139-203×1 | 1779 | 0 | 相続税法 art. 15(1)（遺産に係る基礎控除：三千万円と六百万円に相続人の数を乗じた金額との合計額） |
| `325AC0000000073` | 第十六条 | 4 | 3196 | 8962a5edde[UNRESOLVED_NORM]@0-12×1; c7e2911b4a[UNRESOLVED_NORM]@0-20×2; ce4f26e0e6[UNRESOLVED_NORM]@0-20×1; cf72ee296e[UNRESOLVED_NORM]@0-15×1 | 1779 | 0 | 相続税法 art. 16（相続税の総額における速算表・10%/15%/20%/30%/40%/45%/50%, 上限55 |
| `325AC0000000073` | 第十九条 | 3 | 3196 | 7188dbc4ad[EXCEPTION]@25-202×1; 26a99bd693[EXCEPTION]@254-489×2 | 1779 | 0 | 相続税法 art. 19(1)（相続開始前七年以内の贈与加算・三年超の部分は百万円控除） |
| `325AC0000000073` | 第二十条 | 3 | 3196 | 5b4f333610[REFERENCE]@55-257×1; 2471c211d0[REFERENCE]@56-227×1; 358a4788b5[UNRESOLVED_NORM]@86-136×1; 69d5edc87d[UNRESOLVED_NORM]@676-730×1 | 1779 | 0 | 相続税法 art. 20（相次相続控除） |
| `325AC0000000073` | 第二十一条の六 | 2 | 3196 | f17cd780e2[REFERENCE]@540-689×1; 7a621bf857[REFERENCE]@11-114×1; 3793d632df[APPLICATION_CONDITION]@190-457×1; ca634fe4ff[DELEGATION]@790-873×1 | 1779 | 0 | 相続税法 art. 21-6(1)（贈与税の配偶者控除・二千万円上限） |
| `342AC0000000023` | 第二十条 | 5 | 1923 | d4491043aa[LEGAL_EFFECT]@26-175×1; 3b2c90ac8d[EXCEPTION]@176-453×1; ffb2909220[REFERENCE]@454-573×1; 48dba86c46[LEGAL_EFFECT]@574-617×1 | 976 | 0 | 印紙税法 art. 20（印紙納付に係る過怠税） |
| `342AC0000000035` | (file-level) | 15 | 4973 | b0031a8726[UNRESOLVED_NORM]@0-22×1; 49f17c33ee[UNRESOLVED_NORM]@0-28×1; b1d7eeab3e[UNRESOLVED_NORM]@0-25×1; 01543b20a7[UNRESOLVED_NORM]@0-26×1 | 2030 | 0 | 登録免許税法 別表第一（一）（不動産の登記） |
| `342AC0000000035` | (file-level) | 196 | 4973 | 47513a491e[UNRESOLVED_NORM]@0-20×1; 8c5ccd008e[APPLICATION_CONDITION]@0-50×1; 670b12033e[APPLICATION_CONDITION]@0-54×1; 72836ffb6c[APPLICATION_CONDITION]@0-51×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 (一)〜(九)（人の資格の登録若しくは認定又は技能証明） |
| `342AC0000000035` | (file-level) | 21 | 4973 | c20cbb4804[APPLICATION_CONDITION]@0-69×1; 914e0359ae[APPLICATION_CONDITION]@0-57×1; a392524a16[APPLICATION_CONDITION]@0-69×1; b420ff0454[APPLICATION_CONDITION]@0-53×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 五十九〜六十八（信書便・消防検定・債権回収・通関・酒類・たばこ・塩・著作権等 登 |
| `342AC0000000035` | (file-level) | 20 | 4973 | 28f108ca1d[APPLICATION_CONDITION]@0-66×1; 249127fd69[DELEGATION]@0-82×1; baad20c119[REFERENCE]@0-87×1; 0177a54c9e[REFERENCE]@0-82×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 六十九〜七十五（放射性同位元素・研究施設・水道・食品検査・採血・臓器あつせん 登 |
| `342AC0000000035` | (file-level) | 28 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 七十六〜八十二（精神保健指定医・医薬品医療機器・特定細胞加工物・介護・確定拠出年 |
| `342AC0000000035` | (file-level) | 27 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 八十三〜八十九（労働安全衛生・作業環境測定・卸売市場・農産物検査・JAS・肥料・ |
| `342AC0000000035` | (file-level) | 31 | 4973 | 17b6af60ea[APPLICATION_CONDITION]@0-94×1; 6cf35abd47[APPLICATION_CONDITION]@0-63×1; 397ab06ec0[APPLICATION_CONDITION]@0-65×1; d27da3d3c5[APPLICATION_CONDITION]@0-64×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 九十〜九十六（食品循環資源・農林漁業民宿・木材・馬主・農林中央金庫代理業・電子決 |
| `342AC0000000035` | (file-level) | 28 | 4973 | c3606b1efa[APPLICATION_CONDITION]@0-65×1; 822a543fff[APPLICATION_CONDITION]@0-63×1; ea00233abc[APPLICATION_CONDITION]@0-94×1; 45d9b5dea5[APPLICATION_CONDITION]@0-104×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 九十七〜百二（石油パイプライン・石油輸入・揮発油販売・LPガス・ガス小売・高圧ガ |
| `342AC0000000035` | (file-level) | 24 | 4973 | 850066e2e3[APPLICATION_CONDITION]@0-62×1; b9bccc50c4[REFERENCE]@0-67×1; 0613c2d79b[APPLICATION_CONDITION]@0-68×1; 19e7cf91d4[REFERENCE]@0-109×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百三〜百十（熱供給・小売電気・登録電気工事・エネルギー消費性能判定・工業用水道・ |
| `342AC0000000035` | (file-level) | 24 | 4973 | c0465ca74f[REFERENCE]@0-73×1; 462cea3a6d[APPLICATION_CONDITION]@0-61×1; 40588bc67f[REFERENCE]@0-64×1; 71eafe09d6[APPLICATION_CONDITION]@0-80×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百十一〜百十九（電気用品検査・消費生活用製品検査・JIS認証・計量器校正・工業所 |
| `342AC0000000035` | (file-level) | 12 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百二十〜百二十四（鉄道・索道・軌道・運河開設・港湾技術基準・船舶製造施設・小型船 |
| `342AC0000000035` | (file-level) | 19 | 4973 | a56bcd27e3[DELEGATION]@0-93×1; 3f7a832097[DELEGATION]@0-147×1; 8077f759d9[APPLICATION_CONDITION]@0-60×1; 35c32e82fe[APPLICATION_CONDITION]@0-61×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九（船舶製造工事認定・海洋汚染防止・船舶保安規程・再資源化解体・ |
| `342AC0000000035` | (file-level) | 33 | 4973 | 61fa8301b7[APPLICATION_CONDITION]@0-64×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百三十〜百三十四（船舶安全法認定・海洋汚染防止法・船舶保安規程・船舶運航事業・港 |
| `342AC0000000035` | (file-level) | 33 | 4973 | b838bfe184[REFERENCE]@0-63×1; afea044109[APPLICATION_CONDITION]@0-79×1; b4e7fbb7a0[APPLICATION_CONDITION]@0-80×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九（内航海運・船舶職員登録・船員派遣・船員法登録・航空法許可・無 |
| `342AC0000000035` | (file-level) | 40 | 4973 | 9c2cda76d3[APPLICATION_CONDITION]@0-61×1; 0c8f50900c[APPLICATION_CONDITION]@0-60×1; e2caab9170[REFERENCE]@0-74×1; 7d0188766a[APPLICATION_CONDITION]@0-84×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百四十〜百五十一（証券金融・貸金業・資金決済関連・監査法人・宅建業・マンション管 |
| `342AC0000000035` | (file-level) | 40 | 4973 | 432a49b7a0[APPLICATION_CONDITION]@0-124×1; cc38cf903b[APPLICATION_CONDITION]@0-112×1; 0488d7a9ac[APPLICATION_CONDITION]@0-111×1; b5a3ca29fa[APPLICATION_CONDITION]@0-89×1 | 2030 | 0 | 登録免許税法 別表第一（二）第三十二号 百五十二〜百五十九（測量業・住宅性能評価・建築物エネルギー消費性能・廃棄物再生利 |
| `342AC0000000035` | (file-level) | 63 | 4973 | ff1c83ecec[APPLICATION_CONDITION]@0-40×1; 8fa77ad718[DELEGATION]@0-158×1; 5a2215f9fa[DELEGATION]@0-116×1; 625fcecfbd[UNRESOLVED_NORM]@0-33×1 | 2030 | 0 | 登録免許税法 別表第一（二）第二十四号（一）イ〜ヨ（株式会社等の設立・資本金増加・各種の登記） |
| `325AC0000000226` | 第三十四条 | 16 | 48989 | 90fd033abf[UNRESOLVED_NORM]@919-1000×1; 0d2609a85f[UNRESOLVED_NORM]@1000-1031×1; 726e7800f5[UNRESOLVED_NORM]@6013-6063×1; 92ac9e9732[APPLICATION_CONDITION]@6140-6179×1 | 25870 | 0 | 地方税法 art. 34(2)/(1)二号/六号/八号/八の二/十号/十二号（道府県民税 基礎控除・医療費控除・障害者控 |
| `325AC0000000073` | (file-level) | 2 | 3196 | 5b4f333610[REFERENCE]@55-257×1; 2471c211d0[REFERENCE]@56-227×1 | 1779 | 0 | 相続税法 art. 19-3/19-4（未成年者控除（十万円 × 18歳達年数）／障害者控除（十万円／特別障害者二十万円 |
| `325AC0000000226` | 第三百十四条の三 | 1 | 48989 | (no norm unit contains the needle text) | 25870 | 0 | 地方税法 art. 314の3（市町村民税 所得割の税率・百分の六／指定都市の区域内住所者百分の八） |
| `340AC0000000034` | 第六十四条の五 | 3 | 12849 | c250b5e9dc[REFERENCE]@479-549×1; 6e5944dee3[REFERENCE]@944-1014×1 | 7337 | 0 | 法人税法 art. 64の5（損益通算: 通算対象欠損金額／通算対象所得金額 — 割合×プール配分） |
| `340AC0000000034` | 第五十七条 | 6 | 12849 | 53d643def6[EXCEPTION]@7398-7672×1 | 7337 | 0 | 法人税法 art. 57（欠損金の繰越し: 前十年以内の欠損金を損金算入／ただし書: 百分の五十上限／第十一項: 中小法 |
| `325AC0000000226` | 第三十四条 | 5 | 48989 | e6b859ba13[APPLICATION_CONDITION]@8638-8679×1; 2ece67e8fd[APPLICATION_CONDITION]@8633-8674×1 | 25870 | 0 | 地方税法 art. 34(1)九号（勤労学生 ¥260,000 控除）／第十一号（控除対象扶養親族・特定扶養親族 ¥45 |
| `325AC0000000226` | 第三十四条 | 5 | 48989 | 5e35f33b70[EXCEPTION]@6372-6478×1; ae753dd694[LEGAL_EFFECT]@6623-6757×1; 6096126b54[UNRESOLVED_NORM]@6832-6925×1; 5d12bfb33b[UNRESOLVED_NORM]@6963-7056×1 | 25870 | 0 | 地方税法 art. 34(1)第十号の二（配偶者特別控除: 所得 ¥1,000,000／¥1,300,000／¥1,33 |
| `325AC0000000226` | 第三十四条 | 5 | 48989 | (no norm unit contains the needle text) | 25870 | 0 | 地方税法 art. 34(1)第三号／第四号（社会保険料控除・小規模企業共済等掛金控除） |
| `325AC0000000226` | 第三十四条 | 5 | 48989 | 1972755a79[UNRESOLVED_NORM]@555-602×1; 6c3fd1d819[UNRESOLVED_NORM]@556-603×1 | 25870 | 0 | 地方税法 art. 34(1)第一号（雑損控除 災害関連支出 ¥50,000 以下／超／全額 の閾値計算・超える金額控除 |
| `325AC0000000226` | 第三十四条 | 10 | 48989 | 1f865bbdbf[DELEGATION]@1946-2120×1; f7bb4e89ef[UNRESOLVED_NORM]@5526-5674×1; 6150566a4a[UNRESOLVED_NORM]@5674-5721×1; 1b2bf9bd42[DELEGATION]@1920-2094×1 | 25870 | 0 | 地方税法 art. 34(1)第五号／第五号の三（生命保険料控除 新旧区分の帯域計算・¥28,000 合計上限・¥70, |
| `363AC0000000108` | 第二十九条 | 2 | 5279 | bbc345ce7d[UNRESOLVED_NORM]@105-111×1; 587b05a60a[UNRESOLVED_NORM]@146-153×1; 1a79a996a7[UNRESOLVED_NORM]@421-494×1; 5d9b5f3050[APPLICATION_CONDITION]@548-792×1 | 2863 | 0 | 消費税法 art. 29（税率: 百分の七・八／軽減対象課税資産の譲渡等及び保税地域から引き取られる軽減対象課税貨物 百 |
| `363AC0000000108` | 第二十八条 | 6 | 5279 | d46a0bc2aa[APPLICATION_CONDITION]@6-156×2; ef07d12cf3[EXCEPTION]@178-275×1; 3b1035966b[UNRESOLVED_NORM]@276-363×1; 63bf4a9847[UNRESOLVED_NORM]@454-492×1 | 2863 | 0 | 消費税法 art. 28(1)(2)(3)（課税標準: 対価の額／ただし書著しく低い役員譲渡は資産の価額／特定課税仕入れ |
| `363AC0000000108` | 第二十八条 | 4 | 5279 | a354a26e60[REFERENCE]@538-692×2 | 2863 | 0 | 消費税法 art. 28(4)（保税地域から引き取られる課税貨物の課税標準: 関税定率法art.4〜4の9に準じた価格＋ |
| `363AC0000000108` | 第三十条 | 13 | 5279 | 42acb248bb[REFERENCE]@234-308×1; 1a79a996a7[UNRESOLVED_NORM]@421-494×1; e7caf6d1dd[EXCEPTION]@506-566×1; 0ba37c03e9[EXCEPTION]@578-614×1 | 2863 | 0 | 消費税法 art. 30(1)（仕入れに係る消費税額の控除: 課税標準額に対する消費税額から 課税仕入れ税額＋特定課税仕 |
| `337AC0000000066` | 第六十七条 | 5 | 4169 | e42990d4aa[REFERENCE]@8-108×1; 063a03efd3[LEGAL_EFFECT]@122-193×1; 30a8748b1d[EXCEPTION]@193-258×1; 28917797a2[EXCEPTION]@259-434×2 | 2523 | 0 | 国税通則法 art. 67（不納付加算税: 告知に係る税額等に百分の十／予知でない納付は百分の五） |
| `337AC0000000066` | 第六十六条 | 7 | 4169 | 441de7ac54[REFERENCE]@8-225×2; 7dfd69a533[EXCEPTION]@225-275×1 | 2523 | 0 | 国税通則法 art. 66（無申告加算税: 納付税額×15%／予知でないとき10%／3項三段階 50万以下15%・50万 |
| `337AC0000000066` | 第六十条 | 6 | 4169 | 1755c1b5d3[APPLICATION_CONDITION]@5-44×1; e72c333cfc[EXCEPTION]@343-499×1; 85a329a191[LEGAL_EFFECT]@540-602×2; 94d38bae73[EXCEPTION]@602-650×1 | 2523 | 0 | 国税通則法 art. 60（延滞税: 未納税額に年14.6%／納期限の翌日から二月を経過する日まで等は年7.3% — 日 |
| `337AC0000000066` | 第五十八条 | 6 | 4169 | 52b5f33d6f[APPLICATION_CONDITION]@7-226×3; 082e1c40ee[UNRESOLVED_NORM]@903-941×1; eadf811b1f[UNRESOLVED_NORM]@964-978×1 | 2523 | 0 | 国税通則法 art. 58（還付加算金: 還付金等に年7.3%／差押命令送達の翌日から7日間・仮差押え期間は控除 — 日 |
| `340AC0000000034` | 第六十四条の七 | 5 | 12849 | eed777472e[UNRESOLVED_NORM]@1427-1468×1; fa43011066[APPLICATION_CONDITION]@1468-1515×1; 3243a2d443[APPLICATION_CONDITION]@2447-2504×2; 5525c1ad36[UNRESOLVED_NORM]@2914-2950×1 | 7337 | 0 | 法人税法 art. 64の7（欠損金の通算: 割合は合計額零→零・1超→1にキャップ／非特定欠損金配賦額＝金額×割合 — |
| `325AC0000000073` | 第二十一条の十二 | 4 | 3196 | 6026f839f4[REFERENCE]@20-136×1 | 1779 | 0 | 相続税法 art. 21の12（相続時精算課税の特別控除: 2500万円から既控除合計を控除した残額と控除後課税価格の低 |
| `143AC0000000054` | 第六条 | 4 | 17219 | 7294112f68[DELEGATION]@57-244×1; 80c386f031[DELEGATION]@606-792×1; 4e7ac1b41f[EXCEPTION]@792-835×1 | 14872 | 0 | 関税定率法 art. 6（報復関税等: 別表税率による関税のほか課税価格と同額以下の関税を課すことができる — 追加関税 |
| `325AC0000000073` | (file-level) | 6 | 3196 | 1c9a65c62b[LEGAL_EFFECT]@12-159×1; 24eaa321ba[REFERENCE]@18-173×1; f4cd597696[UNRESOLVED_NORM]@40-98×1 | 1779 | 0 | 相続税法 art. 21の13/26/17（相続時精算課税20%・立木評価85%・各相続人税額の課税価格按分） |
| `340AC0000000034` | (file-level) | 3 | 12849 | (no norm unit contains the needle text) | 7337 | 0 | 法人税法 art. 87/82の5/145の12（退職年金積立金1%・国際最低課税額90.7%・外国法人退職年金1%） |
| `329AC0000000061` | (file-level) | 5 | 4958 | 4c13a866de[DELEGATION]@26-190×2; 573a438ccf[APPLICATION_CONDITION]@155-226×1; 4adb57b7f5[REFERENCE]@74-285×2 | 2469 | 0 | 関税法 art. 14の5（換価代金からの充当: 公売・売却代金から関税に先だつ費用を控除した金額を限度 — 代金・費用 |
| `332AC0000000026` | (file-level) | 4 | 60225 | 4e505c7b64[DELEGATION]@48-252×1; 5f971b0882[DEEMING]@171-299×1 | 29714 | 0 | 租税特別措置法 art. 36/37の15/41の10（資産譲渡5000万円上限・貸付信託不足額控除・定期積金給付補填金 |
| `340AC0000000033` | (file-level) | 7 | 19912 | 11e3217eaa[REFERENCE]@90-178×1; a35a5bb5a6[DELEGATION]@6-146×1 | 14660 | 0 | 所得税法 art. 208/175/179（源泉徴収: 年金(−保険料対応額)×10%・利子15%配当20%・外国法人2 |
| `325AC0000000073` | (file-level) | 18 | 3196 | 23bf59da63[UNRESOLVED_NORM]@96-190×1; 066e8e5741[DELEGATION]@264-402×1; 5ecfe09089[DELEGATION]@808-918×1; 86b4869bf0[UNRESOLVED_NORM]@123-163×1 | 1779 | 0 | 相続税法 art. 23/25（資産評価: 地上権・永小作権の残存期間別割合表5/10/20/30/40/50/60/7 |
| `332CO0000000043` | (file-level) | 3 | 56260 | 9338e7b7fe[DELEGATION]@16-125×1; 2ec34b66e2[LEGAL_EFFECT]@152-253×1 | 29507 | 0 | 租税特別措置法施行令 art. 25の18/40の5の2（按分: 物納非課税部分＝財産価額×政令額/財産価額／特定贈与者 |
| `340CO0000000097` | (file-level) | 6 | 24245 | (no norm unit contains the needle text) | 14083 | 0 | 法人税法施行令 art. 79の2/82の3/83の4（固定資産圧縮限度額＝帳簿価額×(補助金等/取得費)、82の3/8 |
| `342AC0000000035` | (file-level) | 11 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（一）(一)〜(五)（不動産登記: 所有権保存4/1000・移転4/20/1000・地上権等10/ |
| `342AC0000000035` | (file-level) | 3 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（一）(六)〜(十)（抵当権移転1/2/1000・根抵当権一部譲渡2/1000・順位変更/先順位同 |
| `342AC0000000035` | (file-level) | 13 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）十〜十二（著作権・出版権・著作隣接権の登録: 定額24件＋質権設定/信託の割合型4/1000 |
| `342AC0000000035` | (file-level) | 11 | 4973 | a822d279a1[LEGAL_EFFECT]@0-62×1 | 2030 | 0 | 登録免許税法 別表第一（二）十三〜十四（特許権・実用新案権の登録: 移転/専用実施権等の定額＋質権設定4/1000・信託 |
| `342AC0000000035` | (file-level) | 7 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）二（船舶の登記: 船舶の価額千分の4/20/28/1.5・債権金額千分の4/1/2等 — 千 |
| `342AC0000000035` | (file-level) | 20 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）四〜四の四（ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権: 価額千分の1/5 |
| `342AC0000000035` | (file-level) | 18 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）十九〜二十二の二（鉱業権・租鉱権・砂鉱権・特定鉱業権・試掘権/貯留権: 整数千分率9件＋十万 |
| `342AC0000000035` | (file-level) | 25 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）二十二〜二十五（外国会社・投資法人等: 千分の4/2の割合型2件＋定額42件 — 二十四（一 |
| `342AC0000000035` | (file-level) | 15 | 4973 | a625955951[APPLICATION_CONDITION]@0-101×1; 5f5bd2de0d[DEEMING]@188-315×1 | 2030 | 0 | 登録免許税法 別表第一（二）三十三〜三十八（認定個人情報保護団体・警備員講習機関・カジノ・銀行等・電子決済代行・保険・信 |
| `342AC0000000035` | (file-level) | 17 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）三十九〜四十九（担保付社債信託事業・各種金融業登録: 定額45件、四十二・四十三は削除条項で |
| `325CO0000000245` | (file-level) | 3 | 30300 | 4cb95373ec[DELEGATION]@31-148×3 | 16209 | 0 | 地方税法施行令 art. 43の13（軽油引取数量の減少: 特約業者1/100・元売業者0.3%=30/10000 —  |
| `325CO0000000245` | (file-level) | 4 | 30300 | 99ebf94fec[DELEGATION]@26-136×2 | 16209 | 0 | 地方税法施行令 art. 44の3（自動車税の積雪軽減: 割合=1−月数×0.75/10（原文「十分の〇・七五」を3/4 |
| `325CO0000000245` | (file-level) | 2 | 30300 | (no norm unit contains the needle text) | 16209 | 0 | 地方税法施行令 art. 9の14/9の18（政令で定める率 百分の九十九 = 99/100、課税標準×99/100 切 |
| `325CO0000000245` | (file-level) | 2 | 30300 | (no norm unit contains the needle text) | 16209 | 0 | 地方税法施行令 art. 9の22（99%）/35の4の5（百分の七・七 = 77/1000、1000→77 を三層検証 |
| `325CO0000000245` | (file-level) | 4 | 30300 | 6223c863dc[DELEGATION]@28-175×3 | 16209 | 0 | 地方税法施行令 art. 21の8（医療施設の適用除外: 医療収入割合≤3/10を医療収入*10≤3*総収入で判定、「お |
| `325CO0000000245` | (file-level) | 4 | 30300 | 5a83a87339[APPLICATION_CONDITION]@44-238×1 | 16209 | 0 | 地方税法施行令 art. 56の50（事業所税の課税標準特例: 従業者給与総額×指定都市等所在床面積/全床面積、分母0→ |
| `325AC0000000073` | (file-level) | 6 | 3196 | (no norm unit contains the needle text) | 1779 | 0 | 相続税法 art. 24(1) 一号〜三号（定期金の評価: 有期/無期/終身 = max(解約返戻金, 一時金, 基礎額 |
| `325AC0000000073` | (file-level) | 4 | 3196 | 245ae1e9d3[REFERENCE]@1210-1349×1; f76ba3241d[REFERENCE]@1350-1517×1 | 1779 | 0 | 相続税法 art. 24(1) 四号・24(3)(4)（一時金＝給付金額、3項＝min(有期,終身)、4項＝max(有期 |
| `325AC0000000073` | (file-level) | 3 | 3196 | a5739fdb68[EXCEPTION]@943-1204×1 | 1779 | 0 | 相続税法 art. 24(2)(5)（死亡による給付終了の特例: 権利者分＋第三者分の加算、死亡時期・第三者該当性は c |
| `340CO0000000097` | (file-level) | 3 | 24245 | d2f9d0ed5c[LEGAL_EFFECT]@105-168×1; 84494a10cb[REFERENCE]@169-257×1; 49600514df[REFERENCE]@2563-2633×1 | 14083 | 0 | 法人税法施行令 art. 148（通算法人の控除限度額 = 調整前控除限度額−控除限度調整額、調整前 = 第一号×第三号 |
| `340CO0000000097` | (file-level) | 6 | 24245 | 41003210e2[DELEGATION]@19-220×1; 49a8e72dc8[DELEGATION]@703-890×1; 3a4b3bd916[REFERENCE]@1961-2094×1 | 14083 | 0 | 法人税法施行令 art. 157（信託に係る退職年金等積立金額 = (一号+二号−三号−四号)×調整割合、saturat |
| `347CO0000000161` | (file-level) | 5 | 638 | (no norm unit contains the needle text) | 309 | 0 | 地方税法施行令 art. 12（市町村民税の経過措置税率: 均等割290/150/430/230円・所得割×80%・制限 |
| `340CO0000000096` | (file-level) | 3 | 13500 | 199d4cd9f9[APPLICATION_CONDITION]@10-182×3 | 7718 | 0 | NTSC NonTaxSavingsCeiling — NonTaxSavingsCeiling.lean |
| `403AC0000000069` | (file-level) | 5 | 1478 | 3b569da260[REFERENCE]@206-349×1 | 783 | 0 | LVTD LandValueTaxBasicDeduction — LandValueTaxBasicDeduction |
| `351M50000008035` | (file-level) | 4 | 6354 | cb241bc63a[REFERENCE]@131-223×1; 58ae305f38[REFERENCE]@824-969×1 | 3856 | 0 | SpecialDeliveryTaxMarch.lean |
| `332M50000040015` | (file-level) | 4 | 33724 | 8f3b317ba0[REFERENCE]@171-344×1; 523ddd9c10[LEGAL_EFFECT]@191-352×1; 766b87a76d[LEGAL_EFFECT]@1016-1142×1; e98f1bed9b[DELEGATION]@975-1150×1 | 19774 | 0 | ExplorationReserve.lean |
| `363CO0000000360` | (file-level) | 4 | 5495 | 6e7bbd9093[LEGAL_EFFECT]@69-128×1; 38bffd07b2[REFERENCE]@129-238×1; d9bd7b4589[REFERENCE]@239-350×1 | 3103 | 0 | QualifiedInvoiceTaxAmount.lean |
| `404AC0000000015` | (file-level) | 3 | 300 | d9601e2eb8[LEGAL_EFFECT]@53-103×1; 50c10b87ba[LEGAL_EFFECT]@104-195×1 | 151 | 0 | CorporateSpecialTaxBase.lean |
| `328CO0000000407` | (file-level) | 1 | 587 | (no norm unit contains the needle text) | 382 | 0 | AmamiCurrencyConversion.lean |
| `332AC0000000037` | (file-level) | 2 | 191 | (no norm unit contains the needle text) | 94 | 0 | TonnageTax.lean |
| `332CO0000000057` | (file-level) | 1 | 618 | (no norm unit contains the needle text) | 467 | 0 | GasolineDeduction.lean |
| `334CO0000000329` | (file-level) | 1 | 831 | (no norm unit contains the needle text) | 547 | 0 | AuctionDepositValuation.lean |
| `330AC0000000113` | (file-level) | 2 | 252 | 3350ea125d[REFERENCE]@15-146×1 | 136 | 0 | GasolineTransferRounding.lean |
| `325M50000040017` | (file-level) | 2 | 1958 | 7d53a25a74[DELEGATION]@27-148×1 | 1303 | 0 | LegalRatePresentValue.lean |
| `337AC0000000066` | (file-level) | 4 | 4169 | 12e55b05e7[APPLICATION_CONDITION]@47-79×1; 6f6dcd44cc[APPLICATION_CONDITION]@80-141×1; 5fb0398d12[APPLICATION_CONDITION]@142-237×1 | 2523 | 0 | RefundRounding.lean |
| `329CO0000000150` | (file-level) | 2 | 4210 | 274e069f58[REFERENCE]@93-203×1 | 2412 | 0 | CustomsStorageFee.lean |
| `329M50000002023` | (file-level) | 3 | 16604 | 9274f6df8a[APPLICATION_CONDITION]@168-253×1 | 9737 | 0 | TobaccoTaxFixedAmount.lean |
| `420AC0000000084` | (file-level) | 2 | 73 | b8090b3f08[REFERENCE]@159-278×1 | 45 | 0 | RoadGrantAllocation.lean |
| `346AC0000000090` | (file-level) | 2 | 214 | 3c51ac175f[APPLICATION_CONDITION]@183-244×1 | 129 | 0 | WeightTaxTransfer.lean |
| `143AC0000000054` | (file-level) | 2 | 17219 | 4c4ef3de35[APPLICATION_CONDITION]@108-213×1 | 14872 | 0 | TransitionalTariffRate.lean |
| `335AC0000000036` | (file-level) | 2 | 3950 | 5079f4c05b[APPLICATION_CONDITION]@104-285×2 | 2848 | 0 | ProvisionalTariffRate.lean |
| `363AC0000000107` | (file-level) | 2 | 79 | d5dc5c69f8[UNRESOLVED_NORM]@54-127×1 | 50 | 0 | ReformDoubleBasicDeduction.lean |
| `332AC0000000038` | (file-level) | 2 | 90 | 97a109611b[UNRESOLVED_NORM]@86-121×1 | 49 | 0 | TonnageTaxPenalty.lean |
| `329CO0000000164` | (file-level) | 2 | 383 | 45bf25d34f[READING_SUBSTITUTION]@120-310×1 | 223 | 0 | CertFee.lean |
| `340AC0000000033` | (file-level) | 6 | 19912 | b7508e8ecb[UNRESOLVED_NORM]@117-191×1; d3d30d9377[DELEGATION]@337-434×1 | 14660 | 0 | 所得税法 art. 205（源泉徴収: 報酬等×10%、同一人一回百万円超部分×20%、政令控除後×10% — 政令控除 |
| `332CO0000000043` | (file-level) | 4 | 56260 | 7fedea43ee[DELEGATION]@19-105×1; e81285172d[EXCEPTION]@105-262×1; 861c6c8250[EXCEPTION]@319-450×1; c173e462f5[UNRESOLVED_NORM]@724-765×1 | 29507 | 0 | 租税特別措置法施行令 art. 25の16（相続財産に係る譲渡所得の特例: 相続税額×割合を残額(収入−取得費−費用)で |
| `337M50000008017` | (file-level) | 4 | 35762 | 50da7c90aa[APPLICATION_CONDITION]@17-93×1; df344084b5[EXCEPTION]@157-231×1 | 29846 | 0 | 軽油引取税法施行令 art. 23の2（軽油引取税の基準税額: 11,250円×四捨五入(数量×別表率)、指定都市分を控 |
| `332AC0000000026` | (file-level) | 5 | 60225 | f8e85d3ed4[APPLICATION_CONDITION]@10-212×2; 0b0f9816b6[REFERENCE]@213-494×2; c085970909[APPLICATION_CONDITION]@495-654×1 | 29714 | 0 | 租税特別措置法 art. 41の3の11（所得金額調整控除: 1項 (min給与1000万−850万)×10%、2項 m |
| `332AC0000000026` | (file-level) | 5 | 60225 | 6aa613a507[LEGAL_EFFECT]@67-133×1; 42960e003f[DELEGATION]@413-538×1 | 29714 | 0 | 租税特別措置法 art. 41の19（特定の基準所得金額の課税の特例: 3.3億超部分×225/1000(22.5%)− |
| `332CO0000000043` | (file-level) | 5 | 56260 | 95dde002ee[REFERENCE]@94-206×1; 0794e4e3b1[REFERENCE]@279-364×1 | 29507 | 0 | 租税特別措置法施行令 art. 26の12（繰上償還等の場合の所得税還付: (券面−償還)×徴収税率、外国法人分は発行差 |
| `325AC0000000226` | (file-level) | 3 | 48989 | a05c1abbf2[LEGAL_EFFECT]@7-46×1; b1215f315c[REFERENCE]@47-135×1; aee79a8cfc[LEGAL_EFFECT]@136-174×1 | 25870 | 0 | 地方税法 art. 72の49の14（事業主控除: 290万円、1年未満は290万×月数÷12、月数は caller-e |
| `325CO0000000245` | (file-level) | 5 | 30300 | e5ae86d2c6[UNRESOLVED_NORM]@188-250×1; adb43fa278[UNRESOLVED_NORM]@182-244×1 | 16209 | 0 | 地方税法施行令 art. 35の4の6（標準税率超過率 = (基準事業税額−標準税率相当額)/基準事業税額、分母0→0・ |
| `325CO0000000245` | (file-level) | 4 | 30300 | eb2a20af1b[EXCEPTION]@404-461×1; a67d9fc743[REFERENCE]@16-247×1; c86c847b6c[EXCEPTION]@247-304×1 | 16209 | 0 | 地方税法施行令 art. 26（中間納付額に係る延滞金の還付: 延滞金額×還付額/中間納付額、ただし書は第一号−第二号  |
| `340AC0000000033` | (file-level) | 6 | 19912 | (no norm unit contains the needle text) | 14660 | 0 | 所得税法 art. 213（非居住者の国内源泉所得: 一号20%・二号10%、年金控除5万×月数・賞金控除50万 — 政 |
| `325AC0000000226` | (file-level) | 5 | 48989 | ab275aaf3a[REFERENCE]@41-157×1; df21084d2c[LEGAL_EFFECT]@179-245×1; fb6fec6ee3[REFERENCE]@246-357×1; 122d9d148b[DEEMING]@357-461×1 | 25870 | 0 | 地方税法 art. 72の20（付加価値割の課税標準: 報酬給与額/収益配分額が70%超なら雇用安定控除 = 報酬給与− |
| `325AC0000000211` | (file-level) | 3 | 4256 | 3f812e05ad[REFERENCE]@63-262×1 | 2896 | 0 | 地方交付税法 art. 14（基準財政収入額の算定: 利子割/配当割/株式等譲渡所得割の収入見込額から交付金見込額×75 |
| `340AC0000000033` | (file-level) | 8 | 19912 | f1a32489d7[REFERENCE]@6-203×3; 1121acd3f1[DELEGATION]@320-383×1; 6a0fd06261[UNRESOLVED_NORM]@384-466×1 | 14660 | 0 | 所得税法 art. 203の3（公的年金等の徴収税額: 残額×5%、超過分・第七号は10%、162,500×月数の閾値  |
| `325AC0000000226` | (file-level) | 5 | 48989 | b4368f47f1[REFERENCE]@73-204×2; 3f57d306ea[DELEGATION]@231-473×2; b9f4777126[DELEGATION]@454-556×1 | 25870 | 0 | 地方税法 art. 596（特別土地保有税の税額: 課税標準×art.594税率−min(税額, 控除価格×1.4%/4 |
| `340CO0000000097` | (file-level) | 5 | 24245 | 00f8181a22[READING_SUBSTITUTION]@28-276×1; 88d3f1375d[LEGAL_EFFECT]@498-540×1 | 14083 | 0 | 法人税法施行令 art. 139の10（留保金額の計算上控除する地方税額: (法人税額−税額控除)×104/1000−m |
| `403AC0000000069` | (file-level) | 2 | 1478 | (no norm unit contains the needle text) | 783 | 0 | 地価税法 art. 22（地価税額 = (課税価格−基礎控除)×千分の3、saturating控除・floor — 課税 |
| `426AC0000000011` | (file-level) | 4 | 1214 | 665d3637e5[LEGAL_EFFECT]@4-63×1; e9d052ed4f[LEGAL_EFFECT]@64-168×2 | 649 | 0 | 地方法人税法 art. 10（地方法人税額 = 課税標準法人税額×百分の10.3=103/1000、1000→103 を |
| `325AC0000000073` | (file-level) | 5 | 3196 | e434313db3[LEGAL_EFFECT]@12-81×1; 41fd65a9d2[LEGAL_EFFECT]@632-732×1 | 1779 | 0 | 相続税法 art. 23の2（配偶者居住権の評価: 時価−時価×年数割×割合、saturating Nat・floor  |
| `334AC0000000147` | (file-level) | 4 | 2491 | 8c079406ec[REFERENCE]@193-254×1; 41073cdde7[APPLICATION_CONDITION]@264-313×1 | 1467 | 0 | 国税徴収法 art. 104の2（次順位買受申込者の決定: 次順位入札価額の下限＝max(見積価額, 最高入札価額−公売 |
| `325AC0000000073` | (file-level) | 4 | 3196 | 34b5c5394d[APPLICATION_CONDITION]@245-297×1 | 1779 | 0 | 相続税法 art. 25（定期金給付契約の権利の評価: 解約返戻金の定めなしは基礎額×90%／その他は解約返戻金 — 複 |
| `332CO0000000043` | (file-level) | 4 | 56260 | 42467fe8a3[REFERENCE]@19-204×1 | 29507 | 0 | 租税特別措置法施行令 art. 26の27（公的年金等控除最低額の特例: 118万/168万/90万円を65歳以上・年金 |
| `332CO0000000043` | (file-level) | 5 | 56260 | f7747062c6[DELEGATION]@15-262×4 | 29507 | 0 | 租税特別措置法施行令 art. 24（譲渡所得の特別控除額の特例: 5000万円上限・満たない部分・優先順位リスト —  |
| `325CO0000000245` | (file-level) | 5 | 30300 | 5431c0e5ae[DELEGATION]@28-204×1; 2aa36eaa87[DELEGATION]@20-204×3 | 16209 | 0 | 地方税法施行令 art. 56の89の6（支払回数割国保税額の見込額: 前年度税額÷12×12、百円未満端数切り捨て — |
| `342AC0000000035` | (file-level) | 24 | 4973 | 1963782572[APPLICATION_CONDITION]@0-86×1; 5f377e64c3[APPLICATION_CONDITION]@0-65×1 | 2030 | 0 | 登録免許税法 別表第一（二）五十〜五十九（監査法人・公認会計士・消防設備等: 定額25件、デーミング/削除行は fee  |
| `342AC0000000035` | (file-level) | 19 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）二十六〜三十一（投資法人・有限責任事業組合・信託・夫婦財産契約: 定額45件 — 指示は二十 |
| `342AC0000000035` | (file-level) | 15 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）六〜九（企業担保権・企業価値担保権・鉄道財団・動産抵当権等: 千分の2.5=25/10000 |
| `342AC0000000035` | (file-level) | 18 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（二）十五〜十七（意匠権・商標権・回路配置利用権の登録: 定額25件＋質権設定4/1000・信託2 |
| `342AC0000000035` | (file-level) | 17 | 4973 | (no norm unit contains the needle text) | 2030 | 0 | 登録免許税法 別表第一（一）(十一)〜(十五)（相続財産分離・仮登記16区分4/2/10/5/1千分率・表示変更/付記/ |
| `340AC0000000033` | (file-level) | 4 | 19912 | 5a42b9f41a[UNRESOLVED_NORM]@9-137×1 | 14660 | 0 | 所得税法 art. 74（社会保険料控除: 支払額をそのまま総所得等から控除 — 社会保険料該当性は caller-es |
| `340AC0000000033` | (file-level) | 6 | 19912 | 959554d1c3[LEGAL_EFFECT]@6-96×1; 30b4e186e3[REFERENCE]@259-279×1 | 14660 | 0 | 所得税法 art. 86（基礎控除: 合計所得2350万以下58万・2400万以下48万・2450万以下32万・2500 |
| `340AC0000000034` | (file-level) | 3 | 12849 | f8ccc93c83[LEGAL_EFFECT]@0-92×2 | 7337 | 0 | 法人税法 art. 145の4（外国法人 国際最低課税残余額90.7% — 課税標準額は caller-establis |
| `340AC0000000033` | (file-level) | 6 | 19912 | a922dc110e[APPLICATION_CONDITION]@6-133×3; 5cdc52ce2f[REFERENCE]@141-161×1; e1922e8d15[REFERENCE]@136-461×1 | 14660 | 0 | 所得税法 art. 84/186の2（扶養控除: 一般38万・特定63万・老人48万を人数倍 — 原文で58万ではなく4 |
| `332CO0000000043` | (file-level) | 4 | 56260 | 30151cb875[LEGAL_EFFECT]@194-245×1 | 29507 | 0 | 租税特別措置法施行令 art. 46の4（カジノ業務収入割合: 対価合計＋カジノ収入のうちカジノ収入が5%以下かを交差掛 |
| `340AC0000000034` | (file-level) | 3 | 12849 | (no norm unit contains the needle text) | 7337 | 0 | 法人税法 art. 82の13/82の21/145の8（GloBE: 国際最低課税残余額90.7%・国内最低課税額75. |
| `340AC0000000033` | (file-level) | 12 | 19912 | 0567e3223e[APPLICATION_CONDITION]@6-62×1; 1034727933[REFERENCE]@63-83×1; 7d712c0abb[APPLICATION_CONDITION]@8-66×1; 1c04a1b312[REFERENCE]@67-89×1 | 14660 | 0 | 所得税法 art. 80/81/82/211/209の3/182/170（寡婦27万・ひとり親35万・勤労学生27万控除 |
| `143AC0000000054` | 第十条 | 5 | 17219 | 2c6593bb21[DELEGATION]@20-245×3 | 14872 | 0 | 関税定率法 art. 10(1)（変質・損傷の場合の関税軽減: 価格低下率基準の軽減（関税額×低下率）／差額（元の関税額 |
| `143AC0000000054` | 第四条の七 | 4 | 17219 | 19103f0c02[REFERENCE]@17-158×2; 04b0ff42fd[DELEGATION]@159-179×1 | 14872 | 0 | 関税定率法 art. 4の7（価格の換算に用いる外国為替相場: 輸入申告の日の相場で換算、関税法第五条第一号貨物は同号に |
| `143AC0000000054` | 第三条の三 | 7 | 17219 | 1b8772a5f7[EXCEPTION]@196-272×1; 60578f0ed7[EXCEPTION]@284-326×1; 1c62566afd[EXCEPTION]@326-426×1; ca059392e8[DELEGATION]@427-518×2 | 14872 | 0 | 関税定率法 art. 3の3（少額輸入貨物に対する簡易税率: 課税標準価格の合計額が二十万円以下で除外貨物・申出なしなら |
| `143AC0000000054` | 第四条の六 | 7 | 17219 | 17424ac32d[DELEGATION]@22-155×1; f8aad6344f[DELEGATION]@155-298×1; 54ef3c919f[APPLICATION_CONDITION]@299-476×2; 8e57d69cc4[APPLICATION_CONDITION]@476-544×1 | 14872 | 0 | 関税定率法 art. 4の6（航空運送貨物等の特例: 無償見本・緊急輸入貨物等は輸入港までの運賃等を通常运送方法による額 |
| `143AC0000000054` | 第四条の三 | 6 | 17219 | c472b3a00c[REFERENCE]@25-144×1; ab1af0d4f9[UNRESOLVED_NORM]@566-598×1; 2b60b3704e[LEGAL_EFFECT]@1116-1230×1; 6f2a8c2605[LEGAL_EFFECT]@1231-1336×1 | 14872 | 0 | 関税定率法 art. 4の3（国内販売価格又は製造原価に基づく課税価格: 国内販売価格から加工付加価額・手数料利潤経費・ |
| `143AC0000000054` | 第四条の二 | 4 | 17219 | 2600271c91[APPLICATION_CONDITION]@234-309×1; dad65c8772[UNRESOLVED_NORM]@309-444×1; ac267d32b0[DELEGATION]@444-586×1 | 14872 | 0 | 関税定率法 art. 4の2（同種又は類似の貨物の取引価格による課税価格: 双方あるときは同種を優先、同種がなければ類似 |
| `143AC0000000054` | 第四条 | 9 | 17219 | 3579895f06[EXCEPTION]@132-243×1 | 14872 | 0 | 関税定率法 art. 4（課税価格の決定の原則: 現実支払価格に輸入港までの運賃等・手数料・無償提供物品役務・知的財産使 |
| `143AC0000000054` | 第四条の五 | 6 | 17219 | 14cbb17b0f[REFERENCE]@23-138×2; 264162f3b8[LEGAL_EFFECT]@165-281×3; 19103f0c02[REFERENCE]@17-158×1 | 14872 | 0 | 関税定率法 art. 4の5（変質又は損傷に係る輸入貨物の課税価格: 変質がなかつた場合の課税価格から減価額を控除 —  |
| `325AC0000000226` | 第三十五条 | 1 | 48989 | (no norm unit contains the needle text) | 25870 | 0 | 地方税法 art. 35（道府県民税 所得割の税率・百分の四／指定都市の区域内住所者百分の二） |
