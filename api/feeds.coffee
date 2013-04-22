firebase = require('firebase')

validateNoteParam = (params)->
  max_results = if 'max_results' in params then Math.min(200, params['max_results']) else 20
  skip = 0 
  ###TODO: should be added functionalities###
  min_entry_date = 0 
  ###TODO: Return only results with an entry_date greater than or equal to the specified timestamp, which should be in UTC in yyyy-mm-ddThh:mm:ssZ format. If this parameter is specified, results will be returned in forward chronological order.###
  json = true 
  ###this indicates should return a json format###
  {
    "max_results" : max_results
    "skip":skip
    "min_entry_date" : min_entry_date
    "json" : json
  }

validateUserParam = (params)->
  max_results = if 'max_results' in params then Math.min 200, params['max_results'] else 20
  skip = 0 
  ###TODO: should be added functionalities###
  min_entry_date = 0 
  ###TODO: Return only results with an entry_date greater than or equal to the specified timestamp, which should be in UTC in yyyy-mm-ddThh:mm:ssZ format. If this parameter is specified, results will be returned in forward chronological order.###
  json = true 
  ###this indicates should return a json format###
  console.log(params)
  person_record_id = if params['person_record_id'] then params['person_record_id'] else null  
  ###Return only notes for this person record. This parameter is only valid for the note feed.###

  {
    "max_results":max_results
    "skip":skip
    "min_entry_date" : min_entry_date
    "json" : json
    "person_record_id" : person_record_id
  }


#model can be 'user'/'note' key(api_key) is required, max_results, skip, min_entry_data, person_record_id and json should be supported
query = (data, model, params) ->
  if model is not 'user' and model is not 'note'
    return "could not undestand request"
  
  switch model
    when 'user' then getUserHelper data, params['max_results'], params['skip'], params['min_entry_data'], params['json']
    when 'note' then getUserHelper data, params['max_results'], params['skip'], params['min_entry_data'], params['person_record_id'], params['json']


  
getNoteHelper = (data, max_results, skip, min_entry_data, person_record_id, json) ->
  return data 


getUserHelper = (data, max_results, skip, min_entry_data, json) ->
  return data

module.exports.query = query
module.exports.validateNoteParam = validateNoteParam
module.exports.validateUserParam = validateUserParam
