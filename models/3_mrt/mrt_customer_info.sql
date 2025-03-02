{{ config(materialized='table')}}

-- Nombre de commandes par client
-- Commande moyenne par commande de client
-- Dépense totale par client


select *
from {{ref('intermediate_orders')}}
