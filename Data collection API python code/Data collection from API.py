#Data Collection from Zillow's API

import pyzillow
from pyzillow.pyzillow import ZillowWrapper, GetDeepSearchResults
import pandas as pd
import numpy as np
from pyzillow.pyzillow import ZillowWrapper, GetUpdatedPropertyDetails


#Import Data
ny_df=pd.read_csv('uniquenyaddress.csv')

#Shuffle ny data
ny_df_shuffle=ny_df.iloc[np.random.permutation(len(ny_df))]
ny_df_shuffle_ri=ny_df_shuffle.reset_index(drop=True)
#Save shuffled Data
ny_df_shuffle_ri.to_csv('shuffle_ny_df.csv',sep=',')



#Import Shuffled Data
ny_df_shuffle_ri=pd.read_csv('shuffle_ny_df.csv')

#Get first 20000 Data from NY
ny_shuffle_20000=ny_df_shuffle_ri[0:20000]

#Data Wrangling
ny_l=ny_shuffle_20000['add'].tolist()
ny_l2=ny_shuffle_20000['zip'].tolist()
ny_l=[l.lower() for l in ny_l]

ny_add_list=[]
ny_zip_list=[]
L_ny_add=[]
L_ny_zip=[]

for i in range(len(ny_l)):
    if 'undisclosed address' not in ny_l[i]:
        ny_add_list.append(ny_l[i])
        ny_zip_list.append(ny_l2[i])
    else:
        L_ny_add.append(ny_l[i])
        L_ny_zip.append(ny_l2[i])


#Call Zillow's API according to the address and zip code

r=[]
zillow_data = ZillowWrapper('X1-ZWz19r76ysrea3_2m43a')
for i in range(10188,20000):
    address = ny_add_list[i]
    zipcode = ny_zip_list[i]
    try:
        deep_search_response = zillow_data.get_deep_search_results(address, zipcode)
        result = GetDeepSearchResults(deep_search_response)
        l=[result.zillow_id,result.latitude, result.longitude,result.year_built,result.bathrooms,result.bedrooms,result.last_sold_date,result.last_sold_price,
            result.property_size, result.home_type,result.tax_year,result.tax_value,result.home_size,ny_zip_list[i]]
        r.append(l)
    except Exception as e:
        print e.message

    

#Due to the limit of a zillow account, we have to save the results as a numpy array each account

np.save('ny_47.npy', np.array(r))


address = ny_add_list[4173]
zipcode = ny_zip_list[4173]

#Get more detailed information from another Zillow's API (Just a try, not actually use)
zillow_data = ZillowWrapper('X1-ZWz19r5vm222vf_3jtqm')
deep_search_response = zillow_data.get_deep_search_results(address, zipcode)
result = GetDeepSearchResults(deep_search_response)
zillow_id=result.zillow_id
updated_property_details_response = zillow_data.get_updated_property_details(zillow_id)
result = GetUpdatedPropertyDetails(updated_property_details_response)


#merge and combine all the numpy array saved.

r0=np.load('ny_'+str(1)+'.npy')
for i in range(2,48):
    r1=np.load('ny_'+str(i)+'.npy')
    r_temp=np.concatenate((r0,r1), axis=0)
    r0=r_temp


#Save as dataframe
ny_feature=pd.DataFrame(r0,columns=['zillow_id','latitude','longitude','year_built','bathrooms','bedrooms',
                                    'last_sold_date','last_sold_price','property size','home_type','tax_year',
                                    'tax_value','home_size','zipcode'])
ny_feature.to_csv('ny_feature.csv',sep=',')


#Import Data
sf_df=pd.read_csv('uniquesfaddress.csv')

#Data clenaning for sf data
sf_add_list=[]
sf_zip_list=[]
L_add=[]
L_zip=[]

for i in range(len(sf_l)):
    if ('#' not in sf_l[i]) and ('undisclosed address' not in sf_l[i]) and ("san francisco" in sf_l[i]):
        sf_add_list.append(sf_l[i])
        sf_zip_list.append(sf_l2[i])
    else:
        L_add.append(sf_l[i])
        L_zip.append(sf_l2[i])

del sf_add_list[1805],sf_zip_list[1805]
del sf_add_list[7116],sf_add_list[7121]
del sf_zip_list[7116],sf_zip_list[7121]

#call API

r=[]
zillow_data = ZillowWrapper('X1-ZWz19r730qjabv_2ox88')
for i in range(0,20000):
    address = sf_add_list[i]
    zipcode = sf_zip_list[i]
    deep_search_response = zillow_data.get_deep_search_results(address, zipcode)
    result = GetDeepSearchResults(deep_search_response)
    l=[result.zillow_id,result.latitude, result.longitude,result.year_built,result.bathrooms,result.bedrooms,result.last_sold_date,result.last_sold_price,
       result.property_size, result.home_type,result.tax_year,result.tax_value,result.home_size,sf_zip_list[i]]
    r.append(l)

np.save('sanf_12.npy', np.array(r))

#Save data as dataframe
r0=np.load('sanf_'+str(1)+'.npy')
for i in range(2,13):
    r1=np.load('sanf_'+str(i)+'.npy')
    r_temp=np.concatenate((r0,r1), axis=0)
    r0=r_temp

sf_feature=pd.DataFrame(r0,columns=['zillow_id','latitude','longitude','year_built','bathrooms','bedrooms',
                                    'last_sold_date','last_sold_price','property size','home_type','tax_year',
                                    'tax_value','home_size','zipcode'])


sf_feature.to_csv('sf_feature.csv',sep=',')










