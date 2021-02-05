REPO?=quay.io/mrogers950
build :
	docker build -t ${REPO}/tpm:latest . && docker push ${REPO}/tpm:latest

deploy :
	oc apply -f ns.yaml
	oc apply -f deploy.yaml

clean :
	oc delete -f deploy.yaml

