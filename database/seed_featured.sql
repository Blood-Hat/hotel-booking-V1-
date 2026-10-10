SET DEFINE OFF
WHENEVER SQLERROR EXIT SQL.SQLCODE

DECLARE
  PROCEDURE add_hotel(
    p_id NUMBER, p_region VARCHAR2, p_place VARCHAR2, p_name VARCHAR2,
    p_about VARCHAR2, p_type VARCHAR2, p_image VARCHAR2,
    p_single NUMBER, p_double NUMBER, p_deluxe NUMBER
  ) IS
  BEGIN
    INSERT INTO ohbhotels
      (id, region, place, name, about, type, totalrooms,
       typeofroom1, typeofroom2, typeofroom3,
       noofsingleroom, noofdoubleroom, noofdeluxeroom,
       posingleroom, podoubleroom, podeluxeroom, image)
    VALUES
      (p_id, p_region, p_place, p_name, p_about, p_type, 36,
       'Single', 'Double', 'Deluxe', 12, 14, 10,
       p_single, p_double, p_deluxe, p_image);
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN NULL;
  END;
BEGIN
  add_hotel(1007, 'South', 'Pondicherry', 'Seaside Retreat',
    'A relaxed coastal stay close to Pondicherry promenade and the French Quarter.',
    'Resort', 'themes/images/ladies/7.jpg', 2900, 4300, 6500);
  add_hotel(1008, 'South', 'Mysore', 'Mysore Heritage Inn',
    'A comfortable heritage-inspired hotel near the city palace and gardens.',
    'Hotel', 'themes/images/ladies/8.jpg', 2700, 4100, 6100);
  add_hotel(1009, 'International', 'Dubai', 'Dubai Marina Grand',
    'A contemporary high-rise stay with easy access to the marina district.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware2.jpg', 7200, 9900, 14500);
  add_hotel(1010, 'International', 'Canada', 'Maple Leaf Lodge',
    'A warm city lodge combining modern rooms with classic Canadian hospitality.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware1.jpg', 6800, 9200, 13200);
  add_hotel(1011, 'International', 'France', 'Paris Riverside Hotel',
    'An elegant stay with convenient access to central Paris attractions.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware6.jpg', 7900, 10800, 15600);
  add_hotel(1012, 'International', 'Colombia', 'Cartagena Coast Resort',
    'A colourful coastal resort inspired by historic Cartagena.',
    'Resort', 'themes/images/cloth/bootstrap-women-ware5.jpg', 6100, 8500, 12100);
  add_hotel(1013, 'International', 'Ecuador', 'Quito Andean Suites',
    'A welcoming suite hotel overlooking the Andean capital.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware4.jpg', 5700, 7900, 11200);
  add_hotel(1014, 'International', 'Argentina', 'Buenos Aires Plaza',
    'A stylish central hotel suited to city breaks and business travel.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware3.jpg', 6300, 8800, 12600);
  add_hotel(1015, 'International', 'Denmark', 'Copenhagen Harbour Hotel',
    'A clean Scandinavian stay near the harbour and historic city centre.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware2.jpg', 8100, 11100, 15900);
  add_hotel(1016, 'International', 'Australia', 'Sydney Bay Hotel',
    'A bright urban hotel with convenient links to Sydney waterfront attractions.',
    'Hotel', 'themes/images/cloth/bootstrap-women-ware1.jpg', 7600, 10400, 14900);
  COMMIT;
END;
/

PROMPT Featured hotel data ready.
