json.stars @stars, partial: 'star', as: :star
json.partial! 'api/shared/pagination', items: @stars
