def energy(l):
	s = l[0]*l[2] -2*l[0]*l[3] + l[1]*l[2] -3*l[1]*l[4] + 2*l[2]*l[3] + 2*l[2]*l[4] + 3*l[3]*l[4]
	return(s)

if __name__=='__main__':
	k=[0,1]
	all = []
	for a in k:
		for b in k:
			for c in k:
				for d in k:
					for e in k:
						E = energy([a,b,c,d,e])
						all.append([E, str(a)+str(b)+str(c)+str(d)+str(e)])
	all.sort(key=lambda x: x[0])
	for el in all:
		print("Energy = " + str(el[0]) + " for config " + str(el[1]))
