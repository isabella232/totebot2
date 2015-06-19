# Description:
#   Retrieves the next few trains departing the NoMa-Gallaudet Metro station
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   totebot next train
#
# Author:
#   alykat

get_next_train = (msg) ->
    msg.http('https://api.wmata.com/StationPrediction.svc/json/GetPrediction/B35?api_key=0e26b64e7797463f81cc6b60262076c4')
        .header('Accept', 'application/json')
        .get() (error, response, body) ->
            # passes back the complete reponse
            trains = JSON.parse(body)
            if error
                msg.send 'Unable to get train data right now.'
                msg.send error
            else
                msg.send trains[0]

module.exports = (robot) ->
	robot.respond /next train/i, (msg) ->
	    get_next_train(msg)
